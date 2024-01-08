class Contact < ApplicationRecord
  belongs_to :admin, foreign_key: 'update_by', optional: true

  extend Enumerize
  enumerize :contact_type, in: { store_service: 1, business_negotiations: 2, job_entry: 3, franchise: 4, other: 5 }, scope: true, predicates: true
  enumerize :callback_requested, in: { need: 1, no_need: 2 }, default: :need, scope: true, predicates: true
  enumerize :contact_method, in: { email: 1, phone_number: 2 }, scope: true, predicates: true
  enumerize :status, in: {not_started: 1, in_progress: 2, completed: 3}, default: :not_started, scope: true, predicates: true

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
