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
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = 'Category created successfully'
      redirect_to @category
    else
      flash.now[:success] = 'Category creation failed'
      @category = Category.new
      @categories = []
      render 'index'
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      redirect_to @category
    else
      render 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:id]).destroy
  end

  private

  def category_params
    params.require(:category).permit(:title, :description)
  end
end
