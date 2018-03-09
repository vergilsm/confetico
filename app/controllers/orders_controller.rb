# Заказ
# Можно: Посмотреть все заказы
# Создать заказ
# Удалить заказ
class OrdersController < ApplicationController
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
    redirect_to root_path
  end

  private

  def order_params
    params.require(:order).permit(:user_name, :phone, :email, :address, :order_price)
  end
end
