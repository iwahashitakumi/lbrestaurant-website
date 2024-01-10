class ChangeCallbackRequestedToIntegerInContacts < ActiveRecord::Migration[7.0]
  def change
    change_column :contacts, :callback_requested, :integer, null: false, comment: "返信の有無"
  end
end
