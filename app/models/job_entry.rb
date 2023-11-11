class JobEntry < ApplicationRecord
  belongs_to :admin, foreign_key: 'update_by'
  belongs_to :prefecture
end
