class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :set_item,only: [:edit, :show, :update]
  before_action :move_to_index, only: [:edit]

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    binding.pry
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def destroy
    item = Item.find(params[:id])
    if @item.user == current_user
      item.destroy
      redirect_to root_path
   else
      redirect_to root_path
   end
  end

  def edit
  end

  def update

    if @item.update(item_params)
     redirect_to item_path
   else
     render :edit
   end
  end

  def move_to_index
  unless @item.user == current_user 
    redirect_to action: :index
  end
end


  private
  def item_params
    params.require(:item).permit(:name, :explain, :category_id, :delivery_fee_id, :region_id, :shipping_day_id, :price, :image, :state_id).merge(user_id: current_user.id)
  end
end

def set_item
  @item = Item.find(params[:id])
end

