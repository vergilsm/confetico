class Cart < ApplicationRecord
  belongs_to :order
  has_many   :cartitems
  has_many   :items, through: :cartitems
end
