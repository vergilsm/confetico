# Класс в котором создаются категории, которые можно: просматривать, удалять.
# Создается для последующего наполнения категорий товарами(items)
#
class CategoriesController < ApplicationController
  before_action :set_category, only: %I[show destroy]

  def home
    render layout: 'home_page'
  end

  def index
    @categories = Category
  end

  def show
    @category || render_404
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)
    if @category.errors.empty?
      redirect_to category_path(@category)
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
