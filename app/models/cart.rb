class Cart < ApplicationRecord
  has_many   :cart_items
  has_many   :items, through: :cart_items

  # Если item уже есть в корзине, то добавляем к его количеству
  # единицу и перезаписываем cartitem. Если нет, создаем cartitem
  def add_item(item_params)
    if self.items.include?(item_params)
      cart_item = self.cart_items.find_by(item: item_params)
      cart_item.quantity += 1
      cart_item.save
    else
      new_cart_item = CartItem.create(item: item_params, cart: self)
    end

    new_cart_item
  end

  # Общая сумма заказа
  def sub_total
    sum = 0
    self.cart_items.each do |cart_item|
      sum += cart_item.total_price
    end

    sum
  end

  # Общее количество заказов
  def total_items
    self.cart_items.all.map(&:quantity).sum
  end
end
