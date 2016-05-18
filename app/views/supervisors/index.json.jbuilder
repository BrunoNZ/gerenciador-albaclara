json.array!(@supervisors) do |supervisor|
  json.extract! supervisor, :id, :name, :email, :phone
  json.url supervisor_url(supervisor, format: :json)
end
