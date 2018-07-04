class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_page
  before_action :current_cart

  private

  def after_sign_in_path_for(resource)
    admin_index_path
  end

  def after_sign_out_path_for(resource_or_scope)
    request.referrer
  end

  def set_page
    @categories = Category.all
  end

  def current_cart
    @current_cart = Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    @current_cart = Cart.create
    session[:cart_id] = @current_cart.id
  end
end
