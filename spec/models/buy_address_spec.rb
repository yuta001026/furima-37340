require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
before do
  @buy_address = FactoryBot.build(:buy_address)
end
describe '購入内容確認' do
  context '商品購入がうまくいく時' do
    it '全ての値が正しく入力されていれば購入できること' do
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
    it 'telephone_numberが10桁か11桁以外では購入できない' do
      @buy_address.telephone_number = "090123456789"
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Telephone number is invalid")
    end
   end
  end
 end