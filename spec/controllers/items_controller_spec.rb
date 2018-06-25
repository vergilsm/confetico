require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  let(:item) { build(:item) }
  let(:category) { create(:category) }
  let(:admin) { create(:admin) }

  context 'Presentation actions: ' do
    before(:each) do
      item.save
    end

    it 'show action' do
      get :show, params: {id: item.id}

      expect(response).to render_template "show"
    end

    it 'stock action' do
      get :stock, params: { item_id: item.id }

      expect(response).to render_template "stock"
    end
  end

  describe 'Actions: ' do
    before(:each) do
      sign_in admin
      item.save
    end

    context 'POST create' do
      it 'redirects to category if validations pass' do
        post :create, params: { category_id: category.id, item: { name: 'Шоколадка' }},
                      flash: { notice: 'Item created' }

        item = assigns(:item)

        expect(response.status).to eq 200
      end

      it 'render new page again if validations faild' do
        post :create, params: { category_id: category.id, item: { name: '' }}

        expect(response).to render_template "categories/show"
      end
    end

    context 'Put update name' do
      let(:attr) do
        { name: 'Шоколадка' }
      end

      let(:attr1) do
        { name: " " }
      end

      it 'redirects to item_path if item updated' do
        put :update, params: {id: item.id, item: attr },
                     flash: { notice: 'Item updated' }
        item.reload

        expect(item.name).to eq attr[:name]
        expect(response).to redirect_to category_path(item.category.id)
      end

      it 'render edit page again if item is not saved' do
        put :update, params: {id: item.id, item: attr1 }
        item.reload

        expect(response).to render_template "edit"
      end
    end


    context 'DELETE destroy item' do

      it 'redirects to categories path if category is destroyed ' do
        delete :destroy, params: { id: item.id }

        expect(response).to redirect_to category_path(item.category.id)
      end
    end
  end
end
