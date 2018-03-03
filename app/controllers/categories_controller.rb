# Категория товаров
# Категорию можно: создать, просмотреть, удалить
#
class CategoriesController < ApplicationController
  before_action :set_category, only: %I[show destroy]

  def home
    render layout: 'home_page'
  end

  def index
    @categories = Category.all
  end

  def show
    @item = @category.items.build(params[:item])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)
    if @category.save
      redirect_to category_path(@category), notice: 'Category created'
    else
      render :new
    end
  end

  def destroy
    @category.destroy
    redirect_to action: :index
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:product_category)
  end
end
