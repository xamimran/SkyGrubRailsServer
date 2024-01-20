class CreateModifiers < ActiveRecord::Migration[7.1]
  def change
    create_table :modifiers do |t|
      t.string :name

      t.timestamps
    end
  end
end
