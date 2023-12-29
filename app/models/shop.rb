class Shop < ApplicationRecord
  include Discard::Model
  mount_uploader :shop_image, ShopImageUploader
  belongs_to :prefecture
  VALID_POSTAL_CODE_REGEX = /\A\d{3}[-]?\d{4}\z/ 
  validates :postcode, presence: true, format: { with: VALID_POSTAL_CODE_REGEX }
  validates :name, presence: true, uniqueness: true
  validates :prefecture_id, presence: true
  validates :city_name, presence: true
  validates :address, presence: true
  validates :business_time, presence: true
  validates :access, presence: true
  VALID_PHONE_REGEX = /\A0[-\d]{11,12}\z/
  validates :phone_number, presence: true, format: { with: VALID_PHONE_REGEX }
  validates :counter_seat, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :table_seat, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :site_name, presence: true
  validates :gourmet_site_link, presence: true, format: { with: URI.regexp }

  def self.ransackable_attributes(auth_object = nil)
    ["name","city_name", "address"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["prefecture"]
  end
end
