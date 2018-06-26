require 'rails_helper'

RSpec.describe CartsController, type: :controller do
  let(:cart) { create(:cart) }

  context 'Session cart:' do
    it 'show action' do
      get 'show', params: { id: cart.id }

      expect(response).to render_template('show')
    end

    it 'DELETE destroy action' do
      controller.session[:cart_id] = cart.id
      delete :destroy, params: { id: cart.id }

      expect(controller.session[:cart_id]).to eq nil
      expect(response).to redirect_to root_path
    end
  end
end
