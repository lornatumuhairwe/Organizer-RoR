class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
  end

  def index
    @categories = Category.all
    @category = Category.new
  end

  def new
  end

  def create
    @category = Category.new(new_category_params)
    if @category.save
      flash[:success] = 'Category created successfully'
      redirect_to root_url
    else
      flash[:success] = 'Category creation failed'
      redirect_to root_url
    end
  end

  private

  def new_category_params
    params.require(:category).permit(:title, :description)
  end
end
