json.array!(@properties) do |property|
  json.extract! property, :user_id, :home_type, :room_type, :accomodates, :city, :address, :price_night, :title
  json.url property_url(property, format: :json)
end
