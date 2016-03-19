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

  (0..25).each do |client|
    puts 'CRIANDO CLIENTE: ' << client.to_s
    Client.create(
      name: "Cliente #{client.to_s}",
      billing_date: Time.now,
      contract_start_date: Time.now,
      address: "Rua do Cliente #{client}",
      contacts_attributes: [
        {
          name: "Dono 1 do Cliente #{client}",
          email: "dono1@cliente#{client}.com",
          phone: "1234-5678"
        },
        {
          name: "Dono 2 do Cliente #{client}",
          email: "dono3@cliente#{client}.com",
          phone: "1234-5678"
        },
        {
          name: "Dono 3 do Cliente #{client}",
          email: "dono3@cliente#{client}.com",
          phone: "1234-5678"
        }
      ]
    )
  end

  Client.all.each do |client|
    puts 'CRIANDO AGENDAMENTOS PARA CLIENTE: ' << client.name
    (0..100).each do |schedule|
      # puts ' --> AGENDAMENTO: ' << schedule.to_s
      contact_date = Faker::Date.between(1.year.ago,Time.now)
      visit_datetime = Faker::Time.between(contact_date + 2.days, contact_date + 21.days)
      Schedule.create(
        name: "Agendamento #{schedule} do Cliente #{client.id}",
        contact_name: "Nome do contato",
        contact_phone: "1234-5678",
        contact_date: contact_date,
        visit_datetime: visit_datetime,
        address: "Rua do Agendamento #{schedule} do Cliente #{client.id}",
        observation: "",
        status: Faker::Number.between(1,5),
        confirmation_status: Faker::Number.between(1,2),
        client_id: "#{client.id}"
      )
    end
  end

end
