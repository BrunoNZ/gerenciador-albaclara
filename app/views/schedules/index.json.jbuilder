json.array!(@schedules) do |schedule|
  json.extract! schedule, :id, :datetime
  json.url schedule_url(schedule, format: :json)
end
