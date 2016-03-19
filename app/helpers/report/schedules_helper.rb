module Report::SchedulesHelper

  def get_schedules_count(schedules, client, status )
    if schedules.empty?
      return 0
    else
      # puts "CONTANDO PARA: C:#{client.to_s} S:#{status.to_s}"
      # schedules.select{|s| (s.client_id = client) && (s.status = status)}.each do |s|
      #   puts s.inspect
      # end
      # puts "--------------------------------------------------"
      return schedules.select{|s| (s.client_id = client) && (s.status = status)}.count
    end
  end

end
