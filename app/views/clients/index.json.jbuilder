json.array!(@clients) do |client|
  json.extract! client, :id, :name, :billing_date, :contract_start_date, :address
  json.url client_url(client, format: :json)
end
