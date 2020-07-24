# frozen_string_literal: true

module DailySnapshot
  def status(snapshot_date)
    snapshot_date = Date.parse(snapshot_date)
    daily_snapshots(snapshot_date)
  end

  def daily_snapshots(snapshot_date)
    days = (Time.now - snapshot_date).numerator

    if days > 42
      'deleted'
    else
      'retained'
    end
  end
end
