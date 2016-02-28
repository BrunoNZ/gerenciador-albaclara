require 'scheduled/mail'

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
        Scheduled::Mail.delay_send(schedule)
      end
    end

    log.close

  end

end
