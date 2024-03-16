class JobEntry < ApplicationRecord
  belongs_to :admin, foreign_key: 'update_by', optional: true
  belongs_to :prefecture

  extend Enumerize
  enumerize :recruit_type, in: { regular_employee: 1, franchisee: 2 }, scope: true, predicates: true
  enumerize :sex, in: { male: 1, female: 2, other: 3 }, scope: true, predicates: true
  enumerize :status, in: { not_started: 1, in_progress: 2, completed: 3 }, default: :not_started, scope: true, predicates: true

  with_options presence: true do
    validates :recruit_type
    validates :name
    validates :name_kana
    validates :sex
    validates :birth_date
    validates :email, length: { maximum: 255 }, email: true
    validates :phone_number, phone: true
    validates :prefecture_id
    validates :city_name
    validates :address
  end

  scope :search_by_recruit_type, ->(type) { where(recruit_type: type) }
  scope :search_by_sex, ->(method) { where(sex: method) }
  scope :search_by_status, ->(status) { where(status: status) }

  def self.ransackable_scopes(auth_object = nil)
    %i(search_by_recruit_type search_by_sex search_by_status)
  end

  def self.ransackable_attributes(auth_object = nil)
    ["name", "city_name", "address", "recruit_type", "sex", "status"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["prefecture"]
  end
end
