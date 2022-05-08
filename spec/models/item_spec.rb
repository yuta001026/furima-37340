require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

describe "商品出品機能" do
  context '商品出品できるとき' do
    it '全ての情報が存在すれば出品できる' do
      expect(@item).to be_valid
    end
  end
  context '商品出品できないとき' do
   it "商品名が空だと登録できない" do
    @item.name = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Name can't be blank")
   end

   it "商品の説明が空だと登録できない" do
    @item.explain = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Explain can't be blank")
   end

   it "カテゴリーが空だと登録できない" do
    @item.category_id = '1'
    @item.valid?
    expect(@item.errors.full_messages).to include("Category can't be blank")
   end

   it "商品の状態が空だと登録できない" do
    @item.state_id = '1'
    @item.valid?
    expect(@item.errors.full_messages).to include("State can't be blank")
   end

   it "配送料の負担が空だと登録できない" do
    @item.delivery_fee_id = '1'
    @item.valid?
    expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
   end

   it "発送元の地域が空だと登録できない" do
    @item.region_id = '1'
    @item.valid?
    expect(@item.errors.full_messages).to include("Region can't be blank")
   end

   it "発送までの日数が空だと登録できない" do
    @item.shipping_day_id = '1'
    @item.valid?
    expect(@item.errors.full_messages).to include("Shipping day can't be blank")
   end

   it "価格が空だと登録できない" do
    @item.price = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Price can't be blank")
   end

   it "ユーザーが空だと登録できない" do
    @item.user = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("User can't be blank")
   end

   it "価格が全角数値を含む状態では登録できない" do
    @item.price = '３００'
    @item.valid?
    expect(@item.errors.full_messages).to include("Price is not a number")
   end

   it "価格が299以下の数字を含む状態では登録できない" do
    @item.price = '299'
    @item.valid?
    expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
   end

   it "価格が10000000以上の数字を含む状態では登録できない" do
    @item.price = '10000000'
    @item.valid?
    expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
   end


  end
 end
end


