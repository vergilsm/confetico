class CategoriesController < ApplicationController
  before_action :set_category, only: %I[show edit update destroy]
  before_action :authenticate_admin!, except: %I[index show home]
  layout 'devise', except: %I[index show home]

  def home
    @items = Item.order(created_at: :desc).limit(3)
    @home_items = Item.order(created_at: :desc).limit(9)
    render layout: 'home_page'
  end

  def index
    @categories = Category.all
    render layout: 'devise' if current_admin
  end

  def show
    @item = @category.items.build(params[:item])
    render layout: 'devise' if current_admin
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
