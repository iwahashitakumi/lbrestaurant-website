class ChangeUsersToAdmins < ActiveRecord::Migration[7.0]
  def change
    rename_table :users, :admins
  end
end
