require 'scheduled/mail'

namespace :send_mail do

  desc "Do schedules of the day"
  task :schedules => :environment do

    log = ActiveSupport::Logger.new('log/rake_sendmail.log')

    Client.find_each do |client|
      puts "[exec] SchedulesMailer.active_schedules(#{client})"
      ClientMailer.active_schedules(client).deliver_now
    end

    log.close

  end

  desc "Do schedules of the day"
  task :productivity => :environment do

    log = ActiveSupport::Logger.new('log/rake_sendmail.log')

    Client.find_each do |client|
      puts "[exec] SchedulesMailer.update_productivity(#{client})"
      ClientMailer.update_productivity(client).deliver_now
    end

    log.close

  end

end
