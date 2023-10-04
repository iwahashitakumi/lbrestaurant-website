class Prefecture < ApplicationRecord
  has_many :job_entries, class_name: 'JobEntry'
  has_many :shops, class_name: 'Shop'
end
