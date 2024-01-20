json.extract! item_price, :id, :menu_item_id, :base_price, :created_at, :updated_at
json.url item_price_url(item_price, format: :json)
