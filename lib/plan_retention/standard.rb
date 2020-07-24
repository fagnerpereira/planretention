require "plan_retention/version"
require "pry"

module PlanRetention
  class Error < StandardError; end
  class Standard
    def self.status(date)
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
end
