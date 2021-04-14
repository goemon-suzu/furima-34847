class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  has_one :order
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_setting
  belongs_to :shipment_area
  belongs_to :shipping_day

  validates :image, presence: { message: 'をアップロードしてください。' }

  with_options presence: true do
    validates :item_name
    validates :description

    with_options numericality: { other_than: 0, message: 'を選択してください。' } do
      validates :category_id
      validates :condition_id
      validates :delivery_setting_id
      validates :shipment_area_id
      validates :shipping_day_id
    end
    validates :price, format: { with: /\A[0-9]+\z/ }, numericality: { greater_than_or_equal_to: 300, less_than: 9_999_999 }
  end
end
