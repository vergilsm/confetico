class Order < ApplicationRecord
  has_one :cart

  validates :cart, presence: true
  validates :user_name, :phone, :email, presence: true
  validates :email, format: {with: /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i}
  validates :description, length: {maximum: 100}
end
