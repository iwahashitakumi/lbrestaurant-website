class AddForeignKeyToJobEntries < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :job_entries, :users, column: :update_by
  end
end
