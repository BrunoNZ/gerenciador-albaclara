class ClientReportMailer < ApplicationMailer
  default from: 'brunonzanette@gmail.com'

  def welcome_email(client)
    @client = client
    mail(to: "brunonzanette@hotmail.com", subject: 'Welcome to My Awesome Site')
    puts "\n\nEnviou o email...\n\n"
  end
end
