# Preview all emails at http://localhost:3000/rails/mailers/schedules_mailer
class ClientMailerPreview < ActionMailer::Preview
  def active_schedules
    ClientMailer.active_schedules(Client.first)
  end
end
