module Report::SchedulesHelper

  def get_schedules_count(schedules)
    schedules.nil? ? 0 : schedules.count
  end

  def get_schedules_count_per_status(schedules, status)
    schedules.nil? ? 0 : schedules.count{|s| s.status.eql?(status.to_i)}
  end

  def get_date_name(date)
    date
    year = date.to_s.slice(0..3)
    month = date.to_s.slice(4..5)
    return "#{month}/#{year}"
  end

end
