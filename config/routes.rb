Rails.application.routes.draw do
  resources :categories, except: %I[edit update] do
    resources :items, shallow: true
  end

  resources :carts, only: %I[show destroy]
  resources :cart_items, only: %I[create update show destroy]

  root to: 'categories#home'
end
