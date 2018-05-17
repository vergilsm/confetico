class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :cart
  belongs_to :order, optional: true

  #before_save :limit_quantity

  # Стоимость нескольких единиц одного товара
  def total_price
    self.quantity * self.item.price
  end

  # Не даем пользователю заказать товаров больше чем есть в наличии
  def limit_quantity
    if self.quantity > self.item.quantity_item
      self.quantity = self.item.quantity_item
    end
  end
end
