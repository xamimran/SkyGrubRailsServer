class CreateItemPrices < ActiveRecord::Migration[7.1]
  def change
    create_table :item_prices do |t|
      t.references :menu_item, null: false, foreign_key: true
      t.decimal :base_price

      t.timestamps
    end
  end
end
