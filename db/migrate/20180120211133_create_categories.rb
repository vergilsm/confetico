class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :product_category, null: false

      t.timestamps
    end
  end
end
