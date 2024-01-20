class CreateModifierOptions < ActiveRecord::Migration[7.1]
  def change
    create_table :modifier_options do |t|
      t.references :modifier, null: false, foreign_key: true
      t.string :name
      t.decimal :additional_price

      t.timestamps
    end
  end
end
