Rails.application.routes.draw do

  get 'carts_item/create'
  get 'carts_item/destroy'
  get 'carts_item/add_quantity'
  get 'carts_item/reduce_quantity'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'items#index'

  devise_for :users

  get 'static_pages/index'
  get 'static_pages/secret'
  get 'pay_form', to: 'static_pages#pay_form'
  post 'cart_item/:id/add' => "cart_items#add_quantity", as: "cart_item_add"
  post 'cart_item/:id/reduce' => "cart_items#reduce_quantity", as: "cart_item_reduce"
  
  resources :items
  resources :carts
  resources :orders
  resources :cart_items

end
