json.array!(@feedings) do |feeding|
  json.extract! feeding, :id, :user_id, :date, :time, :place, :latitude, :longitude, :price, :feeding_pics, :pax_limit
  json.url feeding_url(feeding, format: :json)
end
