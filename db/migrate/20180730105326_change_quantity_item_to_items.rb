class ChangeQuantityItemToItems < ActiveRecord::Migration[5.0]
  def change
    change_column :items, :quantity_item, :integer, :default=>0
  end
end
