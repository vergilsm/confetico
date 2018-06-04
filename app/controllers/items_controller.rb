# Товар
# Можно: создать, обновить, просмотреть и удалить
#
class ItemsController < ApplicationController
  before_action :set_category, only: %I[new create destroy]
  before_action :set_item, only: %I[show edit update destroy]
  before_action :authenticate_admin!, except: %I[show stock]
  layout 'devise', except: %I[show stock]

  def show; end

  def stock
    @items = Item.all
  end

  def new
    @item = @category.items.build
  end

  def create
    @item = @category.items.build(item_params)
    if @item.save
      redirect_to @category,
        notice: I18n.t('controllers.items.created')
    else
      render 'categories/show'
    end
  end

  def edit; end

  def update
    if @item.update(item_params)
      redirect_to category_path(@item.category_id),
      notice: I18n.t('controllers.items.updated')
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to category_path, notice: I18n.t('controllers.items.destroyed')
  end

  private

  def set_category
    @category = Category.find(params[:category_id]) if params[:category_id]
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :price, :weight, :description,
                                 :quantity_item, :picture, :stock_price)
  end
end
