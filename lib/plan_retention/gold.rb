require "plan_retention/version"
require "pry"

module PlanRetention
  class Error < StandardError; end
  class Gold
    def self.status(date)
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
end
