class AddStateToNews < ActiveRecord::Migration[7.0]
  def change
    add_column :news, :state, :integer, null: false,                comment: "お知らせの状態"
  end
end
