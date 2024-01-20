json.extract! menu_item, :id, :restaurant_id, :type, :types_of_food, :name, :description, :created_at, :updated_at
json.url menu_item_url(menu_item, format: :json)
