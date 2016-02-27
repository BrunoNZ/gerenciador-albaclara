namespace :schedule do

  desc "Do schedules of the day"
  task :day => :environment do

    log = ActiveSupport::Logger.new('log/schedule_rake.log')

    begin
      # Get items from dspace (from offset to offset+limit)
      schedules = Schedule.where(weekday: Time.now.wday)
    rescue => e
      log.warn "No schedules found for today. (Time: #{Time.now} / Weekday: #{Time.now.wday})"
      log.error e
    else
      schedules.each do |schedule|
        schedule_delay = ((schedule.time.hour - Time.now.hour)*1.minute) + (schedule.time.min - Time.now.min)
        log.info "[#{Time.now}] Send email at #{schedule.time} to #{schedule.client.email} - Delay: #{schedule_delay} minutes"
        ClientReportMailer.delay_for(schedule_delay.minutes).welcome_email(schedule.client_id)
      end
    end

    log.close

  end

end
