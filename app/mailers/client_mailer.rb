class ClientMailer < ApplicationMailer
  def active_schedules(client)
    @client = client
    @schedules = @client.find_active_schedules
    client_contacts = @client.contacts.map {|contact| "#{contact.name} <#{contact.email}>"}

    mail(to: client_contacts, subject: 'Welcome to My Awesome Site')
  end
end
