# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

if Rails.env.development?

  (1..10).each do |client|
    puts 'CRIANDO CLIENTE: ' << client.to_s
    Client.create(
      name: "Cliente #{client.to_s}",
      billing_date: Time.now,
      contract_start_date: Time.now,
      address: "Rua do Cliente #{client}",
      contacts_attributes: [
        {
          name: "Dono 1 do Cliente #{client}",
          email: "brunonzanette@hotmail.com",
          phone: "1234-5678"
        },
        {
          name: "Dono 2 do Cliente #{client}",
          email: "danielnoceraz@gmail.com",
          phone: "1234-5678"
        }
      ]
    )
  end

  Client.all.each do |client|
    puts 'CRIANDO AGENDAMENTOS PARA CLIENTE: ' << client.name
    (1..10).each do |schedule|
      # puts ' --> AGENDAMENTO: ' << schedule.to_s
      contact_date = Faker::Date.between(1.year.ago,Time.now)
      visit_datetime = Faker::Time.between(contact_date + 2.days, contact_date + 21.days)
      s = client.schedules.new(
        name: "Agendamento #{schedule} do Cliente #{client.id}",
        contact_name: "Nome do contato",
        contact_phone: "1234-5678",
        contact_date: contact_date,
        visit_datetime: visit_datetime,
        address: "Rua do Agendamento #{schedule} do Cliente #{client.id}",
        observation: "",
        status: Faker::Number.between(1,5),
        confirmation_status: 0
      ).save

      analysis_start_date = Faker::Date.between(1.year.ago,Time.now)
      analysis_end_date = Faker::Date.between(analysis_start_date + 1.days, analysis_start_date + 7.days)
      s = client.productivities.new(
        analysis_start_date: analysis_start_date,
        analysis_end_date: analysis_end_date,
        call_qty: Faker::Number.between(0,20),
        answered_call_qty: Faker::Number.between(0,20),
        interlocutor_qty: Faker::Number.between(0,20),
        schedule_qty: Faker::Number.between(0,20)
      ).save
    end
  end

end
