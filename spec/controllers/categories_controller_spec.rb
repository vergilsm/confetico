require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  let(:category) { create(:category) }
  let(:admin) { create(:admin) }

  it 'index action' do
    get :index

    expect(response.status).to eq 200
    expect(response).to render_template('index')
  end

  it 'show action' do
    get :show, params: { id: category.id }

    expect(response.status).to eq 200
    expect(response).to render_template('show')
  end

  context 'create and destroy actions' do
    before(:each) do
      sign_in admin
    end

    it 'redirects to category_path if validations pass' do
      post :create, params: {category: { product_category: 'category' }}
      category = assigns(:category)

      expect(response).to redirect_to category_path(category)
    end

    it 'render new page again if validtions faild' do
      post :create, params: {category: { product_category: '' }}

      expect(response).to render_template('new')
    end

    it 'redirects to categories path if category is destroyed ' do
      delete :destroy, params: { id: category.id }

      expect(response).to redirect_to categories_path
    end
  end
end
