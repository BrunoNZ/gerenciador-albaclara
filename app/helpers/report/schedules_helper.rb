module Report::SchedulesHelper

  def get_schedules_count(schedules, client, status)
    schedules.empty? ? 0 :
      schedules.count{|s|
         s.client_id.eql?(client.to_i) && s.status.eql?(status.to_i)
      }
  end

end
