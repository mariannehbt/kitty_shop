Rails.application.routes.draw do

  resources :items_images
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'items#index'

  devise_for :users

  get 'static_pages/index'
  get 'static_pages/secret'
  get 'pay_form', to: 'static_pages#pay_form'

  resources :items do
    resources :items_images, only: [:create]
  end
  resources :carts
  resources :orders

end
