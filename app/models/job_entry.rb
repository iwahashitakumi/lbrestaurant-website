class JobEntry < ApplicationRecord
  belongs_to :admin, foreign_key: 'update_by', optional: true
  belongs_to :prefecture

  extend Enumerize

  enumerize :recruit_type, in: {regular_employee: 0, franchisee: 1}, scope: true, predicates: true
  enumerize :sex, in: {male: 0, female: 1}, scope: true, predicates: true
  enumerize :status, in: {not_started: 0, in_progress: 1, completed: 2}, default: :not_started, scope: true, predicates: true
end
