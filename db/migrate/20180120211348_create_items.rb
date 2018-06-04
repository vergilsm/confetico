class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string    :name, null: false
      t.integer   :price
      t.integer   :weight, null: false
      t.boolean   :real
      t.text      :description
      t.integer   :quantity_item
      t.references :category, index: true, foreign_key: true

      t.timestamps
    end
  end
end
