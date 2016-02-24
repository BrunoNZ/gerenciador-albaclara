json.array!(@clients) do |client|
  json.extract! client, :id, :name, :owner, :phone, :address, :email_address
  json.url client_url(client, format: :json)
end
