class ChangeDataJobEntriesToUpdateBy < ActiveRecord::Migration[7.0]
  def change
    change_column :job_entries, :update_by, :bigint
  end
end

