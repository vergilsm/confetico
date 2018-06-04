class AddStockPriceToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :stock_price, :integer
  end
end
