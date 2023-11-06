class ChangeDataContactsToUpdateBy < ActiveRecord::Migration[7.0]
  def change
    change_column :contacts, :update_by, :bigint
  end
end
