class CartSerializer < ActiveModel::Serializer
  attributes :total_price, :total_items
end
