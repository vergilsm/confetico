Rails.application.routes.draw do

  root to: 'categories#home'

  resources :categories do
    resources :items, shallow: true do
      get :stock
    end
  end

  resources :admin, controller: 'admin'

  devise_for :admins

  scope :admins do
    resources :categories do
      resources :items, shallow: true
    end
  end

  resource :cart, only: %I[show destroy]
  resources :cart_items, only: %I[create update show destroy]
  resources :orders, only: %I[index new create destroy]

  get '/deliveries/show'
  get '/deliveries/company'
end
