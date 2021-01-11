class ItemsController < ApplicationController
  before_action :move_index, except: [:index]
  def index
   # @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :product_name, :text, :category_id, :product_status_id, :burden_id, :prefecture_id, :ship_day_id, :price).merge(user_id: current_user.id)
  end

  def move_index
   unless user_signed_in?
    redirect_to action: :index
  end
 end
end
