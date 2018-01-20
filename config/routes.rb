Rails.application.routes.draw do
  root to: 'categories#home'

  resources :categories do
    resources :items
  end
end
