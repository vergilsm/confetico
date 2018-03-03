class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  layout "application"

  before_action :set_page
  before_action :current_cart
  before_action :cart

  private

  def set_page
    @categories = Category.all
  end

  def current_cart
    @current_cart = Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    @current_cart = Cart.create
    session[:cart_id] = @current_cart.id
  end

  def cart
    @cart = @current_cart
  end
end
