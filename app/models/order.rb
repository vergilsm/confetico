class Order < ApplicationRecord
  has_many :cart_items, dependent: :destroy

  REGEXP_USER_NAME = /[\u0400-\u04FF\А-\Я|\а-\я]*/i
  REGEXP_PHONE = /(\+7|7|8)?[\s\-]?\(?[489][0-9]{2}\)?[\s\-]?[0-9]{3}[\s\-]?[0-9]{2}[\s\-]?[0-9]{2}/
  REGEXP_EMAIL = /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i

  validates :user_name, :phone, :email, presence: true
  validates :user_name, format: {with: REGEXP_USER_NAME}
  validates :phone, format: {with: REGEXP_PHONE}
  validates :email, format: {with: REGEXP_EMAIL}
  validates :user_name, length: {maximum: 30}
  validates :address, length: {maximum: 150}

  after_create :minus_quantity_item
  # Сумма всего заказа
  def order_price
    sum = 0
    self.cart_items.each do |cart_item|
      if cart_item.item.price
        all_items_price = cart_item.item.price * cart_item.quantity
      else
        all_items_price = cart_item.item.stock_price * cart_item.quantity
      end

      sum += all_items_price
      self.save
    end

    sum
  end

  # После создания заказа, вычитаем количество заказанное пользователем
  # от общего количества данного товара
  def minus_quantity_item
    self.cart_items.each do |cart_item|
      item = cart_item.item
      item.quantity_item = item.quantity_item - cart_item.quantity
      item.save
    end
  end
end
