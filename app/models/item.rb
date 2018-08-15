class Item < ApplicationRecord
  belongs_to :category
  has_many   :cart_items, dependent: :destroy
  has_many   :carts, through: :cart_items

  validates :category, presence: true
  validates :name, :weight, :description, presence: true
  validates_numericality_of :quantity_item, greater_than_or_equal_to: 0

  validate :price_presence

  mount_uploader :picture, PictureUploader

  # Есть ли товар в наличии?
  def real_item
    quantity_item > 0
  end

  def update_quantity(delta)
    return false if quantity_item + delta < 0
    Item.connection.execute("UPDATE items
                             SET quantity_item = quantity_item + #{delta}
                             WHERE id = #{id};")
  end

  # price или stock_price должен быть
  def price_presence
    if price.blank? && stock_price.blank?
      errors.add(:price, :blank)
      errors.add(:stock_price, :blank)
    end
  end
end
