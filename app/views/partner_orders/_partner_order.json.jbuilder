json.extract! partner_order, :id, :partner_id, :order_id, :customer_review, :partner_status, :assigned_at, :responded_at, :pickup_at, :delivered_at, :notification_sent_at, :notification_response_due_by, :created_at, :updated_at
json.url partner_order_url(partner_order, format: :json)
