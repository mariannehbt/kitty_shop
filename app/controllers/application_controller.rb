class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :current_cart

    private
    def current_cart(user = nil)
        if session[:cart_id]
          cart = Cart.find_by(:id => session[:cart_id])
          if cart.present?
            @current_cart = cart
          else
            session[:cart_id] = nil
          end
        end
  
        if session[:cart_id] == nil
            puts "O"*60
            puts current_user
            puts user
            puts "x"*60
            puts @current_user
          @current_cart = Cart.create(user_id: user)
          session[:cart_id] = @current_cart.id
        end
      end
end
