class CreateMenuItemModifiers < ActiveRecord::Migration[7.1]
  def change
    create_table :menu_item_modifiers do |t|
      t.references :menu_item, null: false, foreign_key: true
      t.references :modifier, null: false, foreign_key: true
      t.boolean :primary

      t.timestamps
    end
  end
end
