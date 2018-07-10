class Cart < ApplicationRecord
  has_many   :cart_items, dependent: :destroy
  has_many   :items, through: :cart_items

  # Если item уже есть в корзине, то добавляем к его количеству
  # единицу и перезаписываем cartitem. Если нет, создаем cartitem
  def add_item(item_params)
    if items.include?(item_params)
      cart_item = cart_items.find_by(item: item_params)
      cart_item.quantity += 1
      cart_item.save
    else
      new_cart_item = CartItem.create(item: item_params, cart: self)
    end

    new_cart_item
  end

  # Общая сумма заказа
  def total_price
    cart_items.map(&:subtotal).sum
  end

  # Общее количество заказов
  def total_items
    cart_items.map(&:quantity).sum
  end
end
