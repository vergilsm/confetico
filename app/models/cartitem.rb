class Cartitem < ApplicationRecord
  belongs_to :item
  belongs_to :cart

  validates :quantity, presence: true
end
