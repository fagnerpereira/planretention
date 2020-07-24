require 'plan_retention/daily_snapshot'
require 'plan_retention/monthly_snapshot'
require 'plan_retention/yearly_snapshot'

module Plan
  class Platinum
    extend DailySnapshot
    extend MonthlySnapshot
    extend YearlySnapshot
  end
end

