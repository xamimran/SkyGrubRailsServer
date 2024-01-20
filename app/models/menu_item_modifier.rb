class MenuItemModifier < ApplicationRecord
  belongs_to :menu_item
  belongs_to :modifier
end
