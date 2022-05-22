class BuysController < ApplicationController

  def index
  @buy_address = BuyAddress.new
  end

  def new
  end

  def create
    @buy_address = BuyAddress.new(buy_params)
    if @buy_address.valid?
      @buy_address.save
      redirect_to root_path
    else
      render :index
    end
  end



  def buy_params
    params.require(:buy_address).permit(:postal_code, :region_id, :municipality, :house_number, :building, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end


