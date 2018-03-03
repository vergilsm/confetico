# Связующий, между корзиной и товаром контроллер
# Можно создать cartitem тем самым добавить товар в корзину,
# изменить количество(quantity) товара,
# удалить cartitem
#
class CartItemsController < ApplicationController
  before_action :current_cart, only: %I[update create destroy]
  before_action :set_cart_item, only: %I[update destroy]

  def create
    item = Item.find(params[:item_id])
    cart = @current_cart
    cart.add_item(item)

    if cart.save
      redirect_to cart_path(@current_cart)
    else
      flash[:error] = 'Не удалось добавить товар в карзину'
      redirect_to item_path(item)
    end
  end

  def update
    @cart_item.update_attributes(cart_item_params)

    respond_to do |format|
      if @cart_item.save
        format.html {redirect_to cart_path(@current_cart)}
        format.json {render json: @cart_item}
      else
        format.html {redirect_to cart_path(@current_cart)}
      end
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
