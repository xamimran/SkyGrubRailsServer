json.extract! user, :id, :username, :first_name, :last_name, :role, :email, :password_hash, :status, :address, :phone, :created_at, :updated_at
json.url user_url(user, format: :json)
