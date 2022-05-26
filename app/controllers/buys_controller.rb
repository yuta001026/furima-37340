class BuysController < ApplicationController
  before_action :move_to_signed_in, only: [:index]
  before_action :set_item,only: [:index, :create]
  

  def index
  @buy_address = BuyAddress.new
  if current_user == @item.user || @item.buy.present?
    redirect_to root_path
  end
end


  def create
    @buy_address = BuyAddress.new(buy_params)
    if @buy_address.valid?
      pay_item
      @buy_address.save
      redirect_to root_path
    else
      render :index
    end
  end


   private
  def buy_params
    params.require(:buy_address).permit(:postal_code, :region_id, :municipality, :house_number, :building, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:id])
    end

  def move_to_signed_in
    if user_signed_in?
      redirect_to '/users/sign_in'
    end
  end

def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  Payjp::Charge.create(
    amount: @item.price,
    card: buy_params[:token],
    currency: 'jpy'
  )
   end
  end


