class ClientMailer < ApplicationMailer

  before_action :set_supervisors

  def active_schedules(client)
    @client = client
    @schedules = @client.find_active_schedules

    unless @schedules.nil? then
      mail(
        to: contacts_of(@client),
        cc: @supervisors,
        subject: 'ALBACLARA - Agenda consolidada'
      )
    end
  end

  def new_schedule(schedule)
    @schedule = schedule
    @client = @schedule.client

    unless @schedule.nil? then
      mail(
        to: contacts_of(@client),
        cc: @supervisors,
        subject: 'ALBACLARA - Novo agendamento'
      )
    end
  end

  def update_schedule_confirmation_status(schedule)
    @schedule = schedule
    @client = @schedule.client

    if @schedule.confirmation_status.equal? 1 then
      template = 'confirm_schedule_status'
      subject = 'ALBACLARA - Agendamento confirmado'
    else
      template = 'unconfirm_schedule_status'
      subject = 'ALBACLARA - Agendamento desmarcado'
    end

    unless @schedule.nil? then
      mail(
        to: contacts_of(@client),
        cc: @supervisors,
        subject: subject,
        template_name: template
      )
    end
  end

  def update_productivity(client)
    @client = client
    @productivity = @client.find_last_productivity

    unless @productivity.nil? then
      mail(
        to: contacts_of(@client),
        cc: @supervisors,
        subject: 'ALBACLARA - Atualização da produtividade'
      )
    end
  end

  private

  def set_supervisors
    @supervisors = Supervisor.all.map{|supervisor|
      "#{supervisor.name} <#{supervisor.email}>"
    }
  end

  def contacts_of(client)
    return @client.contacts.map {|contact|
      "#{contact.name} <#{contact.email}>"
    }
  end

end
