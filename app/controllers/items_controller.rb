class ItemsController < ApplicationController
  def index
  end

  def create
    category = Category.find(params[:category_id])
    @item = category.items.build(items_params)
    if @item.save
      flash[:success] = 'Item added successfully'
      @items = category.items
      redirect_to category_path(category)
    else
      flash[:success] = 'Failed'
      @items = category.items
      redirect_to category_path(category)
    end
  end

  def edit
    @category = Category.find(params[:category_id])
    @item = @category.items.find(params[:id])
  end

  def update
    @category = Category.find(params[:category_id])
    @item = @category.items.find(params[:id])
    @item.update_attributes(update_items_params)
    @items = @category.items
    redirect_to category_path(@category)
  end

  def destroy
    category = Category.find(params[:category_id])
    @item = category.items.find(params[:id])
    @item.destroy
    @items = category.items
    redirect_to category_path(category)
  end

  private

  def items_params
    params.require(:category_item).permit(:title, :description)
  end

  def update_items_params
    params.require(:item).permit(:title, :description)
  end
end
