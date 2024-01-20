class CreateMenuItems < ActiveRecord::Migration[7.1]
  def change
    create_table :menu_items do |t|
      t.references :restaurant, null: false, foreign_key: true
      t.string :type
      t.string :types_of_food
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
