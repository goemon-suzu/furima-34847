class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image






  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_setting
  belongs_to :hipment_area
  belongs_to :shipping_days
end
