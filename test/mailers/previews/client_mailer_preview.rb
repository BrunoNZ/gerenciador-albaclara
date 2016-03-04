# Preview all emails at http://localhost:3000/rails/mailers/schedules_mailer
class ClientMailerPreview < ActionMailer::Preview
  def active_schedules
    ClientMailer.active_schedules(Client.first)
  end

  def new_schedule
    ClientMailer.new_schedule(Schedule.last)
  end

  def update_productivity
    ClientMailer.update_productivity(Client.first)
  end
end
