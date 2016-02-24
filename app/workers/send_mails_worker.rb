class SendMailsWorker
  include Sidekiq::Worker

  sidekiq_options queue: :scheduled_mails

  def perform(id)
  end
end
