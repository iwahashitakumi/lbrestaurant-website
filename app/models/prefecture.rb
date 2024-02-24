class Prefecture < ApplicationRecord
  has_many :job_entries, class_name: 'JobEntry'
  has_many :shops, class_name: 'Shop'

  def self.ransackable_attributes(auth_object = nil)
    ["name"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["job_entries", "shops"]
  end
end
