class OrdersController < ApplicationController
  before_action :authenticate_admin!, except: %I[new create]
  layout 'devise', except: %I[new create]

  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @current_cart.cart_items.each do |cart_item|
      @order.cart_items << cart_item
      cart_item.cart_id = nil
    end

    if @order.save
      OrderMailer.created_order(@order).deliver
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to action: 'index'
  end

  private

  def order_params
    params.require(:order).permit(:user_name, :phone, :email, :address,
                                  :order_price)
  end
end
