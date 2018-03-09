class Order < ApplicationRecord
  has_many :cart_items, dependent: :destroy

  validates :user_name, :phone, :email, presence: true
  validates :user_name, format: {with: /[\u0400-\u04FF\А-\Я|\а-\я]* ([А-Я|а-я])*/i}
  validates :phone, format: {with: /((8|\+7) ?)?\(?\d{3}\)? ?\d{1}-?\d{1}-?\d{1} ?\d{1}-?\d{1}-?\d{1}-?\d{1}/}
  validates :email, format: {with: /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i}
  validates :address, length: {maximum: 150}

  # Сумма всего заказа
  def order_price
    sum = 0
    self.cart_items.each do |cart_item|
      all_items_price = cart_item.item.price * cart_item.quantity
      sum += all_items_price
    end
    sum
  end
end
