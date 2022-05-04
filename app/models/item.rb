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
  validates :price,   presence: true
  validates :user,    presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :region_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :state_id, numericality: { other_than: 1 , message: "can't be blank"}
end
