class Contact < ApplicationRecord
  belongs_to :admin, foreign_key: 'update_by'
end
