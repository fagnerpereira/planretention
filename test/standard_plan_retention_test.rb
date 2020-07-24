# frozen_string_literal: true

require 'test_helper'
require 'date'

# We will retain each snapshot daily for 42 days
# We wont retain the last snapshot of the month for 12 months
# We wont retain the last snapshot of the year for 7 years
describe Plan::Standard do
  describe '.status' do
    current_date = Date.parse('01/01/2020')

    describe 'when it is standard plan with no expired date' do
      snapshot_date = current_date.prev_day(42).strftime('%d/%m/%Y')

      it 'should return "retained" status' do
        Time.stub :now, current_date do
          _(Plan::Standard.status(snapshot_date)).must_equal 'retained'
        end
      end
    end

    describe 'when it is standard plan with expired date' do
      snapshot_date = current_date.prev_day(43).strftime('%d/%m/%Y')

      it 'should return "retained" status' do
        Time.stub :now, current_date do
          _(Plan::Standard.status(snapshot_date)).must_equal 'deleted'
        end
      end
    end

    describe 'when it is standard plan in last day of month' do
      describe 'when current date is 12 months later' do
        snapshot_date = current_date.prev_month(12).strftime('%d/%m/%Y')
        it 'should return "deleted" status' do
          Time.stub :now, current_date do
            _(Plan::Standard.status(snapshot_date)).must_equal 'deleted'
          end
        end
      end

      describe 'when current date is 11 months later' do
        snapshot_date = current_date.prev_month(11).strftime('%d/%m/%Y')
        it 'should return "deleted" status' do
          Time.stub :now, current_date do
            _(Plan::Standard.status(snapshot_date)).must_equal 'deleted'
          end
        end
      end
    end

    describe 'when it is standard plan in last day of year' do
      describe 'when current date is 7 years later' do
        snapshot_date = current_date.prev_year(7).strftime('%d/%m/%Y')
        it 'should return "deleted" status' do
          Time.stub :now, current_date do
            _(Plan::Standard.status(snapshot_date)).must_equal 'deleted'
          end
        end
      end

      describe 'when current date is 6 years later' do
        snapshot_date = current_date.prev_year(6).strftime('%d/%m/%Y')
        it 'should return "deleted" status' do
          Time.stub :now, current_date do
            _(Plan::Standard.status(snapshot_date)).must_equal 'deleted'
          end
        end
      end
    end
  end
end
