require 'scheduled/mail'

namespace :send_mail do

  desc "Do schedules of the day"
  task :schedules => :environment do

    log = ActiveSupport::Logger.new('log/rake_sendmail.log')

    Client.find_each do |client|
      puts "[exec] SchedulesMailer.active_list(#{client})"
      SchedulesMailer.active_list(client).deliver_now
    end

    log.close

  end

end
