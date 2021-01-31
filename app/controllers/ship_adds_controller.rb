class ShipAddsController < ApplicationController
  before_action :authenticate_user!
  def index
    @item = Item.find(params[:item_id])
    @user_donation = UserDonation.new
    if @item.user_id == current_user.id || Buy.where(item_id: @item.id).exists?
      redirect_to root_path 
    end
  end

  def new
    @user_donation = UserDonation.new
  end

  def create
    @item = Item.find(params[:item_id])
    @user_donation = UserDonation.new(donation_params)
     if  @user_donation.valid?
      pay_item
      @user_donation.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def donation_params
    params.require(:user_donation).permit(:prefecture_id, :municipality, :building_name, :postal_code, :street_add, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: donation_params[:token],
      currency: 'jpy'
    )
  end
end