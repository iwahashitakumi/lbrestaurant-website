class Admin < ApplicationRecord
  has_many :contacts, foreign_key: 'update_by'
  has_many :job_entries, foreign_key: 'update_by'
  
  extend Enumerize
  enumerize :role, in: { member: 0, admin: 1 }, default: :member, predicates: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name,
  length: { minimum: 2, maximum: 20 }
  validates :role, presence: true
end
