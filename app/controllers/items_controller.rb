# Класс дает возможность создать, обновить, просмотреть и удалить товар
#
class ItemsController < ApplicationController
  before_action :set_items, only: %I[show edit update destroy]

  def index
    @items = Item
  end

  def show
    @item || render_404
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.errors.empty?
      redirect_to item_url(@item)
    else
      render :new
    end
  end

  def edit end

  def update
    @item.update_attributes(item_params)
    if @item.errors.empty?
      redirect_to item_url(@item), notice: I18n.t('controllers.items.updated')
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to action: :index
  end

  private

  def set_items
    @item = Items.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :price, :weight, :real, :description,
                                 :quantity_item, :category_id)
  end
end
