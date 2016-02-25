class SendScheduledEmailWorker
  include Sidekiq::Worker

  sidekiq_options queue: :scheduled_emails

  def perform(id)
    # Do something
    schedule = Schedule.find(id)
    puts "Sending mail to #{schedule.client.name} -> #{schedule.client.email}"
  end
end
