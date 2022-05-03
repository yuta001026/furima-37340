require 'rails_helper'
 RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context '新規登録できるとき' do
      it '全ての情報が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
     it "nicknameが空だと登録できない" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
     end
     it "emailが空では登録できない" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
     end
     it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'emaiは@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
     it "passwordが空では登録できない" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
     end
     it "passwordが5文字以下では登録できない" do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
     end
     it "passwordが英字のみでは登録できない" do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end
     it "passwordが数字のみでは登録できない" do
      @user.password = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end
     it "passwordが全角文字を含む状態では登録できない" do
      @user.password = 'KKK111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end
     it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
     it "name_seiが空では登録できない" do
      @user.name_sei = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name sei can't be blank")
     end
     it "name_seiに半角文字が含まれていては登録できない" do
      @user.name_sei = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Name sei 全角文字を使用してください")
     end
     it "name_meiが空では登録できない" do
      @user.name_mei = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name mei can't be blank")
     end
     it "name_meiに半角文字が含まれていては登録できない" do
      @user.name_mei = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Name mei 全角文字を使用してください")
     end
     it "name_sei_kanaが空では登録できない" do
      @user.name_sei_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include ("Name sei kana can't be blank")
     end
     it "name_sei_kanaにカタカナ以外の文字が含まれていると登録できない" do
      @user.name_sei_kana = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include ("Name sei kana 全角文字を使用してください")
     end
     it "name_mei_kanaが空では登録できない" do
      @user.name_mei_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include ("Name mei kana can't be blank")
     end
     it "name_mei_kanaにカタカナ以外の文字が含まれていると登録できない" do
      @user.name_mei_kana = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include ("Name mei kana 全角文字を使用してください")
     end
     it "birthdayが空では登録できない" do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
     end
    end
  end
end
