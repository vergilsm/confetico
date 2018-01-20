class CreateCarts < ActiveRecord::Migration[5.0]
  def change
    create_table :carts do |t|
      t.references :order, index: true, foreign_key: true

      t.timestamps
    end
  end
end
