require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
before do
  user = FactoryBot.create(:user)
  item = FactoryBot.create(:item)
  @buy_address = FactoryBot.build(:buy_address, user_id: user.id, item_id: item.id)
end
describe '購入内容確認' do
  context '商品購入がうまくいく時' do
    it '全ての値が正しく入力されていれば購入できること' do
      expect(@buy_address).to be_valid
    end
    it '建物が空でも登録できること' do
      @buy_address.building = ''
      expect(@buy_address).to be_valid
    end
  end

  context '商品購入がうまくいかない時' do
    it 'postal_codeが空だと購入できない' do
      @buy_address.postal_code = nil
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeにハイフンがないと購入できない' do
      @buy_address.postal_code = "1234567"
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    it 'regionが未選択だと購入できない' do
      @buy_address.region_id = 0
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Region can't be blank")
    end
    it 'municipalityが空だと購入できない' do
      @buy_address.municipality = nil
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Municipality can't be blank")
    end
    it 'house_numberが空だと購入できない' do
      @buy_address.house_number = nil
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("House number can't be blank")
    end
    it 'telephone_numberが空だと購入できない' do
      @buy_address.telephone_number = nil
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Telephone number can't be blank")
    end
    it 'telephone_numberが9桁以下では購入できない' do
      @buy_address.telephone_number = "123456789"
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Telephone number is invalid")
    end

    it 'telephone_numberが12桁以上では購入できない' do
      @buy_address.telephone_number = "123456789101112"
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Telephone number is invalid")
    end

    it '半角数字以外の文字が入力された場合購入できない' do
      @buy_address.telephone_number = "１２３４５６７８９"
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Telephone number is invalid")
    end

    it 'userが紐付いていないと保存できない' do
      @buy_address.user_id = nil
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("User can't be blank")
    end

    it 'itemが紐付いていないと保存できない' do
      @buy_address.item_id = nil
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Item can't be blank")
    end

    it "tokenが空では登録できないこと" do
      @buy_address.token = nil
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Token can't be blank")
    end
   end
  end
 end