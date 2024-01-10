class ChangeContactColumnsNullConstraints < ActiveRecord::Migration[7.0]
  def change
    change_column_null :contacts, :name, true
    change_column_null :contacts, :name_kana, true
    change_column_null :contacts, :phone_number, true
    change_column_null :contacts, :contact_method, true
  end
end
