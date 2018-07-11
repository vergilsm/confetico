class CartsController < ApplicationController
  before_action :cart

  def show; end

  def destroy
    @cart.destroy
    session[:cart_id] = nil
    redirect_to root_path
  end

  private

  def cart
    @cart = @current_cart
  end
end
