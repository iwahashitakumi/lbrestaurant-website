class Contact < ApplicationRecord
  belongs_to :admin, foreign_key: 'update_by', optional: true

  extend Enumerize
  enumerize :contact_type, in: { store_service: 0, business_negotiations: 1, job_entry: 2, franchise: 3, other: 4 }, scope: true, predicates: true
  enumerize :contact_method, in: { email: 0, phone_number: 1 }, scope: true, predicates: true
  enumerize :status, in: {not_started: 0, in_progress: 1, completed: 2}, default: :not_started, scope: true, predicates: true

  scope :search_by_contact_type, ->(type) { where(contact_type: type) }
  scope :search_by_contact_method, ->(method) { where(contact_method: method) }
  scope :search_by_status, ->(status) { where(status: status) }

  def self.ransackable_scopes(auth_object = nil)
    %i(search_by_contact_type search_by_contact_method search_by_status)
  end

  def self.ransackable_attributes(auth_object = nil)
    ["name", "contact_type", "contact_method", "status"]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
