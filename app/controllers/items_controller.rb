# Класс дает возможность создать, обновить, просмотреть и удалить товар
#
class ItemsController < ApplicationController
  before_action :set_category, only: %I[show create destroy]
  before_action :set_item, only: %I[show edit update destroy]

  def show
  end

  def create
    @item = @category.items.build(item_params)
    if @item.save
      redirect_to @category, notice: 'Item created'
    else
      render 'categories/show'
    end
  end

  def edit
  end

  def update
    if @category.items.update(item_params)
      redirect_to @category, notice: 'Item updated'#I18n.t('controllers.items.updated')
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to category_path
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
                                 :quantity_item)
  end
end
