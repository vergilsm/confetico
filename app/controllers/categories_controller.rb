# Категория товаров
# Home - root page
# Категорию можно: создать, просмотреть, удалить
#
class CategoriesController < ApplicationController
  before_action :set_category, only: %I[show edit update destroy]
  before_action :authenticate_admin!, except: %I[index show home]
  layout 'devise', except: %I[index show home]

  def home
    render layout: 'home_page'
  end

  def index
    @categories = Category.all
    if current_admin
      render layout: 'devise'
    end
  end

  def show
    @item = @category.items.build(params[:item])
    if current_admin
      render layout: 'devise'
    end
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)
    if @category.save
      redirect_to category_path(@category),
      notice: I18n.t('controllers.categories.created')
    else
      render :new
    end
  end

  def edit; end

  def update
    if @category.update(category_params)
      redirect_to categories_path,
      notice: I18n.t('controllers.categories.updated')
    else
      render :edit
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
    params.require(:category).permit(:product_category, :picture)
  end
end
