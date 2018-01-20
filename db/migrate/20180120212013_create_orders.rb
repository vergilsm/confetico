class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :user_name
      t.string :phone
      t.string :email
      t.string :address
      t.float  :order_price
      t.float  :total_amount

      t.timestamps
    end
  end
end
