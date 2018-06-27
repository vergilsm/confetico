require 'rails_helper'

RSpec.describe CartItemsController, type: :controller do
  let(:item) { create(:item) }
  let(:cart_item) { build(:cart_item) }

  context 'POST create action' do
    it 'redirects to cart_path(cart) if validations pass' do
      post :create, params: { item_id: item.id }
      cart = cart_item.cart
      cart.save

      expect(response).to redirect_to cart_path(cart)
    end
  end

  context 'DELETE destroy action' do
    it 'redirects to cart_path(cart) if cart_item is destroyed' do
      post :create, params: { item_id: item.id }
      cart_item.save
      cart = cart_item.cart
      cart.save

      delete :destroy, params: { id: cart_item.id }

      expect(response).to redirect_to cart_path(cart)
    end
  end
end
