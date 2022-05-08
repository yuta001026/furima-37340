class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :region
  belongs_to :category
  belongs_to :shipping_day
  belongs_to :state
  belongs_to :delivery_fee
  belongs_to :user
  has_one_attached :image
  validates :name,    presence: true
  validates :explain, presence: true
  with_options presence: true, format: {with:  /\A[0-9]+\z/} do
    validates :price,  numericality: { only_integr: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
    presence: {message: "can't be blank"}
  end
  validates :user,    presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :region_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_fee_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_day_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :state_id, numericality: { other_than: 1 , message: "can't be blank"}
end
