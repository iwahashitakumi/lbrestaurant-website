class JobEntry < ApplicationRecord
  belongs_to :user, foreign_key: 'update_by'
  belongs_to :prefecture
end
