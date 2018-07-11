class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :cart
  belongs_to :order, optional: true

  before_save :limit_quantity

  # Стоимость нескольких единиц одного товара
  def subtotal
    if item.price
      quantity * item.price
    else
      quantity * item.stock_price
    end
  end

  # Не даем пользователю заказать товаров больше чем есть в наличии
  def limit_quantity
    self.quantity = item.quantity_item if quantity > item.quantity_item
  end
end
