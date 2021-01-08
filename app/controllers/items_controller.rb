class ItemsController < ApplicationController
 def index
   @users = User.all
 end

 def index
  @items = Item.all
end

 def new
  @item = Item.new
 end

 def create
  if Items.create(item_params)
    redirect_to root_path
  else
    render :new
  end
 end

 private

 def item_params
  params.require(:item).permit(:content, :image)
 end
end
