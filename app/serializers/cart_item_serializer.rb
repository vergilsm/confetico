class CartItemSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :subtotal

  belongs_to :cart
end
