class Category < ApplicationRecord
  has_many :items

  validates :product_category, presence: true
  mount_uploader :picture, PictureUploader
end
