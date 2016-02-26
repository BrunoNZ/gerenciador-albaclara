json.array!(@schedules) do |schedule|
  json.extract! schedule, :id, :weekday, :time, :client_id
  json.url schedule_url(schedule, format: :json)
end
