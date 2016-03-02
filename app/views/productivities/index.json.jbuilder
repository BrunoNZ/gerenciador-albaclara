json.array!(@productivities) do |productivity|
  json.extract! productivity, :id, :analysis_start_date, :analysis_end_date, :call_qty, :answered_call_qty, :interlocutor_qty, :schedule_qty, :client_id
  json.url productivity_url(productivity, format: :json)
end
