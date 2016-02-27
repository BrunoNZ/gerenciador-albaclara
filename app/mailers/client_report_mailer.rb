class ClientReportMailer < ApplicationMailer
  default from: 'brunonzanette@gmail.com'

  def welcome_email(client)
    client = Client.find(client)
    mail(to: client.email, subject: 'Welcome to My Awesome Site')
    puts "\n\nEnviou o email para o cliente #{client.name}...\n\n"
  end
end
