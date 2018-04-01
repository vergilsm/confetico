Rails.application.routes.draw do
  devise_for :admins
  resources :categories, except: %I[edit update] do
    resources :items, shallow: true
  end

  resources :carts, only: %I[show destroy]
  resources :cart_items, only: %I[create update show destroy]
  resources :orders, only: %I[index new create destroy]

  root to: 'categories#home'
end
