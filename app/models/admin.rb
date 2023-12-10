class Admin < ApplicationRecord
  has_many :contacts, foreign_key: 'update_by'
  has_many :job_entries, foreign_key: 'update_by'
  
  extend Enumerize
  enumerize :role, in: { member: 0, admin: 1, owner: 2 }, default: :member, scope: true, predicates: true
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
  validates :name, length: { minimum: 2, maximum: 20 }
  validates :role, presence: true

  scope :search_by_role, ->(role) { where(role: role) }

  def self.ransackable_scopes(auth_object = nil)
    %i(search_by_role)
  end

  def self.ransackable_attributes(auth_object = nil)
    ["name", "role"]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
