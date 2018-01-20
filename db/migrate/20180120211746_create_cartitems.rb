class CreateCartitems < ActiveRecord::Migration[5.0]
  def change
    create_table :cartitems do |t|
      t.references :item, index: true, foreign_key: true
      t.references :cart, index: true, foreign_key: true
      t.integer    :quantity

      t.timestamps
    end
  end
end
