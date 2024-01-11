class JobEntry < ApplicationRecord
  belongs_to :admin, foreign_key: 'update_by', optional: true
  belongs_to :prefecture

  extend Enumerize

  enumerize :recruit_type, in: {regular_employee: 1, franchisee: 2}, scope: true, predicates: true
  enumerize :sex, in: {male: 1, female: 2}, scope: true, predicates: true
  enumerize :status, in: {not_started: 1, in_progress: 2, completed: 3}, default: :not_started, scope: true, predicates: true


  validates :recruit_type, presence: true
  validates :name, presence: true
  validates :name_kana, presence: true
  validates :sex, presence: true
  validates :birth_date, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }
  VALID_PHONE_REGEX = /\A0[-\d]{11,12}\z/
  validates :phone_number, presence: true, format: { with: VALID_PHONE_REGEX }
  validates :prefecture_id, presence: true
  validates :city_name, presence: true
  validates :address, presence: true
  
  scope :search_by_recruit_type, ->(type) { where(recruit_type: type) }
  scope :search_by_sex, ->(method) { where(sex: method) }
  scope :search_by_status, ->(status) { where(status: status) }

  def self.ransackable_scopes(auth_object = nil)
    %i(search_by_recruit_type search_by_sex search_by_status)
  end

  def self.ransackable_attributes(auth_object = nil)
    ["name","city_name", "address", "recruit_type", "sex", "status" ]
  end

  def self.ransackable_associations(auth_object = nil)
    ["prefecture"]
  end
end
