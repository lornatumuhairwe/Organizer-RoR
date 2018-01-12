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

  private

  def items_params
    params.require(:category_item).permit(:title, :description)
  end
end
