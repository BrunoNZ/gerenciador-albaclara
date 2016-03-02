class ClientMailer < ApplicationMailer

  def active_schedules(client)
    @client = client
    @schedules = @client.find_active_schedules

    unless @schedules.nil? then
      mail(to: contacts_of(@client), subject: 'Welcome to My Awesome Site')
    end
  end

  def update_productivity(client)
    @client = client
    @productivity = @client.find_last_productivity

    unless @productivity.nil? then
      mail(to: contacts_of(@client), subject: 'Welcome to My Awesome Site')
    end
  end

  private

  def contacts_of(client)
    return @client.contacts.map {|contact| "#{contact.name} <#{contact.email}>"}
  end

end
