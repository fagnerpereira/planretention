require "test_helper"
require "pry"
require "date"

#We will retain each snapshot daily for 42 days
#We will retain the last snapshot of the month for 12 months
describe PlanRetention::Gold do
  describe '#snapshot_at' do
    current_date = Date.parse('01/01/2020')

    describe 'when it is gold plan with current day 40 days later' do
      snapshot_at = current_date.prev_day(40).strftime('%d/%m/%Y')

      it 'should return "retained" status' do
        Time.stub :now, current_date do
          _(PlanRetention::Gold.status(snapshot_at)).must_equal 'retained'
        end
      end
    end

    describe 'when it is gold plan with current day 43 days later' do
      snapshot_at = current_date.prev_day(43).strftime('%d/%m/%Y')

      it 'should return "retained" status' do
        Time.stub :now, current_date do
          _(PlanRetention::Gold.status(snapshot_at)).must_equal 'deleted'
        end
      end
    end

    describe 'when it is gold plan in last day of month' do
      describe 'when current date is 13 months later' do
        it 'should return "deleted" status' do
          Time.stub :now, current_date do
            _(PlanRetention::Gold.status('30/11/2018')).must_equal 'deleted'
          end
        end
      end

      describe 'when current date is 12 months later' do
        it 'should return "deleted" status' do
          Time.stub :now, current_date do
            _(PlanRetention::Gold.status('31/01/2019')).must_equal 'retained'
          end
        end
      end
    end

    describe 'when it is gold plan in last day of year' do
      describe 'when current date is 7 years later' do
        it 'should return "deleted" status' do
          Time.stub :now, current_date do
            _(PlanRetention::Gold.status('31/12/2013')).must_equal 'deleted'
          end
        end
      end

      describe 'when current date is 8 years later' do
        it 'should return "deleted" status' do
          Time.stub :now, current_date do
            _(PlanRetention::Gold.status('01/01/2014')).must_equal 'deleted'
          end
        end
      end
    end
  end
end
