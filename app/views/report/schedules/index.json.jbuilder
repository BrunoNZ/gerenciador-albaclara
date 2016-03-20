json.array!(@report_schedules) do |report_schedule|
  json.extract! report_schedule, :id
  json.url report_schedule_url(report_schedule, format: :json)
end
