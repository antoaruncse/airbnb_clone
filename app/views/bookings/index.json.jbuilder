json.array!(@bookings) do |booking|
  json.extract! booking, :property_id, :user_id, :check_in_date, :check_out_date, :no_accomodates
  json.url booking_url(booking, format: :json)
end
