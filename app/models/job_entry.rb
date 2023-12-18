class JobEntry < ApplicationRecord
  belongs_to :admin, foreign_key: 'update_by', optional: true
  belongs_to :prefecture

  extend Enumerize

  enumerize :recruit_type, in: {regular_employee: 0, franchisee: 1}, scope: true, predicates: true
  enumerize :sex, in: {male: 0, female: 1}, scope: true, predicates: true
  enumerize :status, in: {not_started: 0, in_progress: 1, completed: 2}, default: :not_started, scope: true, predicates: true

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
