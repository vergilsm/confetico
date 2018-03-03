class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :user_name, null: false
      t.string :phone, null: false
      t.string :email, null: false
      t.string :address
      t.integer  :order_price, null: false

      t.timestamps
    end
  end
end
