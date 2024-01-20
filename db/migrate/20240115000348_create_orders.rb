class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.references :restaurant, null: false, foreign_key: true
      t.string :status
      t.decimal :total_price
      t.integer :estimated_wait_time
      t.string :delivery_address
      t.decimal :delivery_mileage
      t.boolean :cancelled
      t.string :cancellation_reason
      t.datetime :cancelled_at
      t.decimal :delivery_fee
      t.decimal :tip_amount
      t.text :partner_review

      t.timestamps
    end
  end
end
