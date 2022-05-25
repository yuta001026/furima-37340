class BuysController < ApplicationController

  def index
  @buy_address = BuyAddress.new
  @item = Item.find(params[:item_id])
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
end

def pay_item
  Payjp.api_key = "sk_test_16970974d33d87a17cc7eb7d"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
  Payjp::Charge.create(
    amount: order_params[:price],  # 商品の値段
    card: order_params[:token],    # カードトークン
    currency: 'jpy'                 # 通貨の種類（日本円）
  )
end


