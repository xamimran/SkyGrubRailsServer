class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :menu_item
  has_many :order_item_modifiers
end
