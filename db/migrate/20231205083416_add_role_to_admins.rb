class AddRoleToAdmins < ActiveRecord::Migration[7.0]
  def change
    add_column :admins, :role, :integer, null: false,        comment: "管理者の役割"
  end
end
