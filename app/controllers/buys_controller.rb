class BuysController < ApplicationController
  before_action :move_to_signed_in, only: [:index]
  before_action :move_to_index, only: [:index] 

  def index
  @buy_address = BuyAddress.new
  @item = Item.find(params[:item_id])
  if current_user == @item.user
    redirect_to root_path
  end
end

  def new
  end

  def create
    @buy_address = BuyAddress.new(buy_params)
    @item = Item.find(params[:item_id])
    if @buy_address.valid?
      pay_item
      @buy_address.save
      redirect_to root_path
    else
      render :index
    end
  end



  def buy_params
    params.require(:buy_address).permit(:postal_code, :region_id, :municipality, :house_number, :building, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def move_to_signed_in
    unless user_signed_in?
      redirect_to '/users/sign_in'
    end
  end

  def move_to_index
    @item = Item.find(params[:item_id])
  unless @item.user == current_user 
    redirect_to action: :index
  end
end


def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  Payjp::Charge.create(
    amount: @item.price,  # 商品の値段
    card: buy_params[:token],    # カードトークン
    currency: 'jpy'                 # 通貨の種類（日本円）
  )
   end
  end


