class BuyAddress
  include ActiveModel::Model
  attr_accessor :postal_code,:region_id,:municipality,:house_number,:building,:telephone_number, :item_id, :user_id


  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
  validates :region_id, numericality: {other_than: 0, message: "can't be blank"}

  def save
    # 寄付情報を保存し、変数donationに代入する
    buy = Buy.create(user_id: user_id, item_id: item_id)
    # 住所を保存する
    # donation_idには、変数donationのidと指定する
    Address.create(postal_code: postal_code, region_id: region_id, municipality: municipality, house_number: house_number, building: building, telephone_number: telephone_number, buy_id: buy.id)
  end
end