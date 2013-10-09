json.array!(@users) do |user|
  json.extract! user, :first_name, :last_name, :email, :password_digest, :mobile, :address, :country, :remember_token
  json.url user_url(user, format: :json)
end
