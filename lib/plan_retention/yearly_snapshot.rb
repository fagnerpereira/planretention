module YearlySnapshot
  def status(snapshot_date)
    snapshot_date = Date.parse(snapshot_date)
    last_day_of_month = Date.civil(snapshot_date.year, snapshot_date.month, -1).day

    if last_day_of_month == snapshot_date.day
      if snapshot_date.month == 12
        yearly_snapshots(snapshot_date)
      else
        monthly_snapshots(snapshot_date)
      end
    else
      daily_snapshots(snapshot_date)
    end
  end

  def yearly_snapshots(snapshot_date)
    limit_date = snapshot_date.next_year(7)

    if limit_date - Time.now < 0
      'deleted'
    else
      'retained'
    end
  end
end
