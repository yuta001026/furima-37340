class BuyAddress
  include ActiveModel::Model
  attr_accessor :postal_code,:region_id,:municipality,:house_number,:building,:telephone_number, :item_id, :user_id


  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipality
    validates :house_number
    validates :telephone_number
    validates :telephone_number, format: {with: /\A\d{10,11}\z/, message: "is invalid"}
    validates :region_id, numericality: {other_than: 0, message: "can't be blank"}
  end

  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, region_id: region_id, municipality: municipality, house_number: house_number, building: building, telephone_number: telephone_number, buy_id: buy.id)
  end
end