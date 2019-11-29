Rails.application.routes.draw do

  # get 'carts_item/create'
  # get 'carts_item/destroy'
  # get 'carts_item/add_quantity'
  # get 'carts_item/reduce_quantity'
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
  resources :carts_item
  post 'carts_item/:id/add' => "carts_item#add_quantity", as: "cart_item_add"
  post 'carts_item/:id/reduce' => "cart_item#reduce_quantity", as: "cart_item_reduce"

end
