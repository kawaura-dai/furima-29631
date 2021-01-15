class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
  def index
    @items = Item.all.order("created_at DESC")
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

 # def show 詳細表示機能
 #   @item = Item.find(params[:id])
 # end

  private

  def item_params
    params.require(:item).permit(:image, :product_name, :text, :category_id, :product_status_id, :burden_id, :prefecture_id, :ship_day_id, :price).merge(user_id: current_user.id)
  end
end
