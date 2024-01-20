class User < ApplicationRecord
    has_many :orders, foreign_key: 'user_id'
    has_many :partner_orders, foreign_key: 'user_id'

    scope :partners, -> { where(role: 'partner') }

    def self.partner_performance(status)
        joins(:partner_orders => :order)
        .where(role: 'partner', partner_orders: { partner_status: status })
        .select(
          "users.id, 
          users.username, 
          COUNT(partner_orders.id) AS completed_orders, 
          SUM(orders.delivery_fee) AS total_delivery_fees, 
          SUM(orders.tip_amount) AS total_tips, 
          AVG(julianday(partner_orders.delivered_at) - julianday(partner_orders.assigned_at)) * 24 * 60 * 60 AS avg_delivery_time"
        )
        .group("users.id")
      end
end
