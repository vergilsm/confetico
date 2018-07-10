class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :cart
  belongs_to :order, optional: true

  before_save :limit_quantity

  # Стоимость нескольких единиц одного товара
  def total_price
    if self.item.price
      self.quantity * self.item.price
    else
      self.quantity * self.item.stock_price
    end
  end

  # Не даем пользователю заказать товаров больше чем есть в наличии
  def limit_quantity
    if quantity > item.quantity_item
      self.quantity = item.quantity_item
    end
  end
end
