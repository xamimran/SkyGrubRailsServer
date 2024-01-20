class Restaurant < ApplicationRecord
    has_many :orders, foreign_key: 'restaurant_id'
end
