json.extract! restaurant, :id, :name, :address, :phone, :cuisine_type, :created_at, :updated_at
json.url restaurant_url(restaurant, format: :json)
