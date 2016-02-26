namespace :schedule do

  desc "Do schedules of the day"
  task :day => :environment do

    log = ActiveSupport::Logger.new('log/schedule_rake.log')

    # Get items from dspace (from offset to offset+limit)
    schedules = Schedule.where(weekday: Time.now.wday)

    # Terminate loop if there are no more items to import
    break if schedules.empty?

    schedules.each do |schedule|
      # puts "Send email at #{schedule.time} to #{schedule.client.email}"
      log.info "Send email at #{schedule.time} to #{schedule.client.email}"
    end

    log.close

  end

end
