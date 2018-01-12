class ItemsController < ApplicationController
  def index
  end

  def create
    category = Category.find(params[:category_id])
    @item = category.items.build(items_params)
    if @item.save
      flash[:success] = 'Item added successfully'
      redirect_to root_url
    else
      flash[:success] = 'Failed'
      redirect_to root_url
    end
  end

  def update
    category = Category.find(params[:category_id])
    @item = category.items.find(params[:id])
    @item.update(items_params)
    redirect_to category_items_path(category)
  end

  def destroy
    category = Category.find(params[:category_id])
    @item = category.items.find(params[:id])
    @item.destroy
    redirect_to category_items_path(category)
  end

  private

  def items_params
    params.require(:category_item).permit(:title, :description)
  end
end
