# frozen_string_literal: true

module MonthlySnapshot
  def status(snapshot_date)
    snapshot_date = Date.parse(snapshot_date)
    last_day_of_month = Date.civil(snapshot_date.year, snapshot_date.month, -1).day

    if last_day_of_month == snapshot_date.day
      monthly_snapshots(snapshot_date)
    else
      daily_snapshots(snapshot_date)
    end
  end

  def monthly_snapshots(snapshot_date)
    limit_date = snapshot_date.next_month(12)

    if (limit_date - Time.now).negative?
      'deleted'
    else
      'retained'
    end
  end
end
