require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  let(:order) { build(:order) }
  let(:admin) { create(:admin) }
  let(:item) { create(:item) }
  let(:cart_item) { create(:cart_item, item_id: item.id) }
  let(:cart) { create(:cart) }

  context 'Index action: ' do
    before(:each) do
      sign_in admin
    end

    it 'render index page' do
      get :index

      expect(response).to render_template('index')
    end
  end

  context 'Create action: ' do
    let(:attr) do
      { user_name: order.user_name,
        phone: order.phone,
        email: order.email,
        address: order.address
      }
    end

    it 'redirects to root_path if validations pass' do
      controller.session[:cart_id] = cart.id
      order.cart_items << cart_item
      cart_item.cart_id = nil

      expect(order.cart_items.size).to eq 1

      post :create, params: { order: attr }

      expect(controller.session[:cart_id]).to eq nil
      expect(response).to redirect_to root_path
    end

    it 'render new page again if validations faild' do
      post :create, params: {order: { user_name: '' }}

      expect(response).to render_template('new')
    end
  end

  context 'DELETE destroy action: ' do
    before(:each) do
      sign_in admin
    end

    it 'redirects to root_path if order is destroyed' do
      order.save
      delete :destroy, params: { id: order.id }

      expect(response).to redirect_to orders_path
    end
  end
end
