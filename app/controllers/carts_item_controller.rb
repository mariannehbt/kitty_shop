class CartsItemController < ApplicationController
  before_action :current_cart
  before_action :set_cart_item, only: [:show, :edit, :update, :destroy]
    def create
      
     
      item = Item.find(params[:item_id])
      @cart = @current_cart
      @cart_item = @cart.add_product(item)
      
     
        respond_to do |format|
            if @cart_item.save
              format.html { redirect_to @cart_item.cart, notice: 'Cart was successfully created.' }
              format.json { render :show, status: :created, location: @cart_item }
            else
              format.html { render :new }
              format.json { render json: @cart.errors, status: :unprocessable_entity }
            end
          end
        
    end

    def destroy
      @cart_item = CartsItem.find(params[:id])
      @cart_item.destroy
      redirect_to @cart_item.cart, notice: 'Votre item a ete supprimer' 

    end  

    def add_quantity
      @cart_item = CartsItem.find(params[:id])
      @cart_item.quantity += 1
      @cart_item.save
      redirect_to cart_path(@current_cart)
    end
    
    def reduce_quantity
      @cart_item = CartsItem.find(params[:id])
      if @cart_item.quantity > 1
        @cart_item.quantity -= 1
      end
      @cart_item.save
      redirect_to cart_path(@current_cart)
    end



    private
       # Use callbacks to share common setup or constraints between actions.
       def set_cart_item
        @cart_item = CartsItem.find(params[:id])
      end

      def cart_join_params
        params.require(:cart_item).permit(:cart_id, :item_id)
      end

      def set_cart
          @cart = Cart.find_by(id: session[:cart_id]) ||  Cart.create
          session[:cart_id] ||= @cart.id
      end
    
end
