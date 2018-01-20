class Category < ApplicationRecord
  has_many :items

  validates :product_category, presence: true
end
