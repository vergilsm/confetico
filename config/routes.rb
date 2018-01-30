Rails.application.routes.draw do
  root to: 'categories#home'

  resources :categories, except: [:edit, :update] do
    resources :items, shallow: true
  end
end
