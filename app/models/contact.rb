class Contact < ApplicationRecord
  belongs_to :user, foreign_key: 'update_by'
end
