class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string  :name, null: false
      t.float   :price, null: false
      t.float   :weight, null: false
      t.boolean :real
      t.string  :description
      t.integer :quantity_item
      t.references :category, index: true, foreign_key: true

      t.timestamps
    end
  end
end
