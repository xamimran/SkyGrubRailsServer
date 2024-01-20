class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :role
      t.string :email
      t.string :password_hash
      t.string :status
      t.string :address
      t.string :phone

      t.timestamps
    end
  end
end
