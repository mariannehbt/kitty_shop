Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'items#index'

  devise_for :users

  get 'static_pages/index'
  get 'static_pages/secret'

  resources :items
  resources :carts
  resources :orders
  
end
