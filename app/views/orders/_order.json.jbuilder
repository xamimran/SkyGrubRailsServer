json.extract! order, :id, :user_id, :restaurant_id, :status, :total_price, :estimated_wait_time, :delivery_address, :delivery_mileage, :cancelled, :cancellation_reason, :cancelled_at, :delivery_fee, :tip_amount, :partner_review, :created_at, :updated_at
json.url order_url(order, format: :json)
