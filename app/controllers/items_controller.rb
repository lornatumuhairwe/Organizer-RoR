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

  def edit
    @category = Category.find(params[:category_id])
    @item = @category.items.find(params[:id])
  end

  def update
    @category = Category.find(params[:category_id])
    @item = @category.items.find(params[:id])
    @item.update_attributes(update_items_params)
    redirect_to root_path
  end

  def destroy
    category = Category.find(params[:category_id])
    @item = category.items.find(params[:id])
    @item.destroy
    redirect_to root_path
  end

  private

  def items_params
    params.require(:category_item).permit(:title, :description)
  end

  def update_items_params
    params.require(:item).permit(:title, :description)
  end
end
