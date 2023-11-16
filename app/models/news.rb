class News < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["title", "body"]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
