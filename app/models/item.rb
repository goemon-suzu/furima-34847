class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image
#  has_one :order

  with_options presence: true do
    with_options numericality: { other_than: 0 } do
      validates :item_name
      validates :description
      validates :category_id
      validates :condition_id
      validates :delivery_setting_id
      validates :shipment_area_id
      validates :shipping_days_id
      
      with_options in: 300..9_999_999, message: 'This site is only for under 300 and over 9,999,999'
        validates :price
      end
    end
  end







  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_setting
  belongs_to :hipment_area
  belongs_to :shipping_days
end
