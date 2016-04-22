json.array!(@feeders) do |feeder|
  json.extract! feeder, :id, :user_id, :feeding_id
  json.url feeder_url(feeder, format: :json)
end
