class Shop < ApplicationRecord
  include Discard::Model
  mount_uploader :shop_image, ShopImageUploader
  belongs_to :prefecture

  VALID_POSTAL_CODE_REGEX = /\A\d{3}[-]?\d{4}\z/

  with_options presence: true do
    validates :postcode, format: { with: VALID_POSTAL_CODE_REGEX }, uniqueness: true
    validates :name, uniqueness: true
    validates :prefecture_id
    validates :city_name
    validates :address
    validates :business_time
    validates :access
    validates :phone_number, phone: true
    validates :site_name
    validates :gourmet_site_link, format: { with: URI.regexp }
  end
  with_options numericality: { only_integer: true, greater_than_or_equal_to: 0 } do
    validates :counter_seat
    validates :table_seat
  end

  def self.ransackable_attributes(auth_object = nil)
    ["name", "city_name", "address"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["prefecture"]
  end
end
