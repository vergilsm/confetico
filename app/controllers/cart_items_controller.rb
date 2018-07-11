class CartItemsController < ApplicationController
  before_action :current_cart, only: %I[update create destroy]
  before_action :set_cart_item, only: %I[update destroy]

  def create
    item = Item.find(params[:item_id])
    cart = @current_cart
    cart.add_item(item)

    respond_to do |format|
      if cart.save
        format.html { redirect_to cart_path(@current_cart) }
        format.js
      else
        redirect_to item_path(item)
      end
    end
  end

  def update
    @cart_item.update_attributes(cart_item_params)

    respond_to do |format|
      @cart_item.save
      format.html { redirect_to cart_path(@current_cart) }
      format.json { render json: {cart_item: CartItemSerializer.new(@cart_item)} }
    end
  end

  def destroy
    @cart_item.destroy
    redirect_to cart_path(@current_cart)
  end

  private

  def set_cart_item
    @cart_item = CartItem.find(params[:id])
  end

  def cart_item_params
    params.require(:cart_item).permit(:quantity)
  end
end
