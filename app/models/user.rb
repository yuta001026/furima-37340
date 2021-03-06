class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :items
         has_many :buys
         validates :nickname, presence: true
         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 
         validates :name_sei, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' }
         validates :name_mei, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' }
         validates :name_sei_kana, presence: true, format: { with: /\A[ァ-ヶ]+\z/, message: '全角文字を使用してください' }
         validates :name_mei_kana, presence: true, format: { with: /\A[ァ-ヶ]+\z/, message: '全角文字を使用してください' }
         validates :birthday, presence: true
end
