json.array!(@appointments) do |appointment|
  json.extract! appointment, :id, :name, :email, :time
  json.url appointment_url(appointment, format: :json)
end
