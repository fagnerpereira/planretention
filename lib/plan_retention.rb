require "plan_retention/version"
require "pry"

module PlanRetention
  class Error < StandardError; end
  class Standard
    def snapshot_at(date)
      current_date = Time.now
      last_snapshot = Date.parse(date)

      days = (current_date - last_snapshot).numerator

      if days > 42
        'deleted'
      else
        'retained'
      end
    end
  end
  class Gold
    def snapshot_at(date)
      current_date = Time.now
      last_snapshot = Date.parse(date)

      last_day_of_month = Date.civil(last_snapshot.year, last_snapshot.month, -1).day

      if last_day_of_month == last_snapshot.day
        limit_date = last_snapshot.next_month(12)

        if limit_date - current_date < 0
          'deleted'
        else
          'retained'
        end
      else
        days = (current_date - last_snapshot).numerator

        if days > 42
          'deleted'
        else
          'retained'
        end
      end
    end
  end
  class Platinum
    def snapshot_at(date)
      current_date = Time.now
      last_snapshot = Date.parse(date)

      last_day_of_month = Date.civil(last_snapshot.year, last_snapshot.month, -1).day

      if last_day_of_month == last_snapshot.day
        if last_snapshot.month == 12
          limit_date = last_snapshot.next_year(7)

          if limit_date - current_date < 0
            'deleted'
          else
            'retained'
          end
        else
          limit_date = last_snapshot.next_month(12)

          if limit_date - current_date < 0
            'deleted'
          else
            'retained'
          end
        end
      else
        days = (current_date - last_snapshot).numerator

        if days > 42
          'deleted'
        else
          'retained'
        end
      end
    end
  end
end
