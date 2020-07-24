# frozen_string_literal: true

require 'plan_retention/daily_snapshot'

module Plan
  class Standard
    extend DailySnapshot
  end
end
