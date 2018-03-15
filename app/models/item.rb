class Item < ApplicationRecord
  belongs_to :category
  has_many   :cart_items, dependent: :destroy
  has_many   :carts, through: :cart_items

  validates :category, presence: true
  # Цена должна быть больше нуля
  validates :price, numericality: {greater_than: 0, allow_nil: true}
  validates :name, :price, :weight, :description, presence: true
  validates_numericality_of :quantity_item, greater_than_or_equal_to: 0

  mount_uploader :picture, PictureUploader
end
