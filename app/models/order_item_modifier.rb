class OrderItemModifier < ApplicationRecord
  belongs_to :order_item
  belongs_to :modifier_option
end
