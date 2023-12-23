class ChangeStateToStatusInNews < ActiveRecord::Migration[7.0]
  def change
    rename_column :news, :state, :status
  end
end
