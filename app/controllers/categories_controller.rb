class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @items = @category.items
  end

  def index
    @categories = Category.all
    @category = Category.new
  end

  def new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = 'Category created successfully'
      redirect_to @category
    else
      flash.now[:success] = 'Category creation failed'
      @category = Category.new
      @categories = Category.all
      render 'index'
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      flash[:success] = "Update successful"
      redirect_to @category
    else
      @category = Category.find(params[:id])
      flash.now[:success] = "Update Failed"
      render 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:id]).destroy
    @categories = Category.all
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:title, :description)
  end
end
