class ChangeDataJobEntriesToPrefectureId < ActiveRecord::Migration[7.0]
  def change
    change_column :job_entries, :prefecture_id, :bigint
  end
end
