json.array!(@schedules) do |schedule|
  json.extract! schedule, :id, :datetime, :client_id
  json.url schedule_url(schedule, format: :json)
end
