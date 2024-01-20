class CreateHoursOfOperations < ActiveRecord::Migration[7.1]
  def change
    create_table :hours_of_operations do |t|
      t.references :restaurant, null: false, foreign_key: true
      t.string :day
      t.string :openTime1
      t.string :closeTime1
      t.string :openTime2
      t.string :closeTime2

      t.timestamps
    end
  end
end
