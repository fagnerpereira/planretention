require 'plan_retention/daily_snapshot'
require 'plan_retention/monthly_snapshot'

module Plan
  class Gold
    extend DailySnapshot
    extend MonthlySnapshot
  end
end

