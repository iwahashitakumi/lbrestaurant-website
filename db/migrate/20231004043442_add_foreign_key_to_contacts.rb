class AddForeignKeyToContacts < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :contacts, :users, column: :update_by
  end
end
