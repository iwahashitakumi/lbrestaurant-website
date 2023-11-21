class Shop < ApplicationRecord
  mount_uploader :shop_images, ShopImagesUploader
  belongs_to :prefecture
  validates :name, presence: true, uniqueness: true
  validates :prefecture_id, presence: true
  validates :city_name, presence: true
  validates :address, presence: true, uniqueness: true
  validates :business_time, presence: true
  validates :access, presence: true
  VALID_PHONE_REGEX = /\A0[-\d]{11,12}\z/
  validates :phone_number, presence: true, format: { with: VALID_PHONE_REGEX }
  validates :counter_seats, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :table_seats, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :site_name, presence: true
  validates :gourmet_site_link, presence: true, format: { with: URI.regexp }
end
