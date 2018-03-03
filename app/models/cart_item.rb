class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :cart
  #belongs_to :order, optional: true

  # Стоимость нескольких единиц одного товара
  def total_price
    self.quantity * self.item.price
  end
end
