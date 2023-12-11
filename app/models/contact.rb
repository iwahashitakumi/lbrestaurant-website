class Contact < ApplicationRecord
  belongs_to :admin, foreign_key: 'update_by'

  extend Enumerize
  enumerize :contact_type, in: { store_service: 0, business_negotiations: 1, job_entry: 2, franchise: 3, other: 4 }, scope: true, predicates: true
  enumerize :status, in: {not_started: 0, in_progress: 1, completed: 2}, default: :not_started, scope: true, predicates: true
end
