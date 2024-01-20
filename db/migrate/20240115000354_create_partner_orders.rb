class CreatePartnerOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :partner_orders do |t|
      t.references :user, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.text :customer_review
      t.string :partner_status
      t.datetime :assigned_at
      t.datetime :responded_at
      t.datetime :pickup_at
      t.datetime :delivered_at
      t.datetime :notification_sent_at
      t.datetime :notification_response_due_by

      t.timestamps
    end
  end
end
