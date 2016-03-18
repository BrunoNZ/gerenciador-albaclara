json.array!(@schedules) do |schedule|
  json.extract! schedule, :id, :name, :contact_name, :contact_phone, :contact_date, :visit_datetime, :address, :observation, :status, :client_id
  json.url schedule_url(schedule, format: :json)

  json.client do
    json.name schedule.client.name
  end

end
