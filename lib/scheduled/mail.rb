module Scheduled
  module Mail

    def self.delay_send(schedule)
      return if !schedule.weekday.equal? Time.now.wday

      schedule_delay = delay_minutes(schedule)
      Rails.logger.info "[#{Time.now}] Send email at #{schedule.time} to #{schedule.client.email} - Delay: #{schedule_delay} minutes"
      ClientReportMailer.delay_for(schedule_delay.minutes).welcome_email(schedule.client_id)
    end

    private

    def self.delay_minutes(schedule)
      return ((schedule.time.hour - Time.now.hour)*1.minute) + (schedule.time.min - Time.now.min)
    end

  end
end
