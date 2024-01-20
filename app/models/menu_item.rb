class MenuItem < ApplicationRecord
  belongs_to :restaurant
  has_many :order_items
  has_many :item_prices
  def self.top_selling(limit)
    select('menu_items.*, COUNT(order_items.id) AS sales_count')
      .joins(:order_items)
      .group('menu_items.id')
      .order('sales_count DESC')
      .limit(limit)
  end
end
