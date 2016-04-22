json.array!(@payments) do |payment|
  json.extract! payment, :id, :feeder_id, :braintree_id, :status, :last_4
  json.url payment_url(payment, format: :json)
end
