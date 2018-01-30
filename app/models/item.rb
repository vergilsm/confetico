class Item < ApplicationRecord
  belongs_to :category
  has_many   :cartitems
  has_many   :carts, through: :cartitems

  validates :category, presence: true
  # Цена должна быть больше нуля
  validates :price, numericality: {greater_than: 0, allow_nil: true}
  validates :name, :price, :weight, :description, :quantity_item, presence: true
end
