class AddStateToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :state, :integer, null: false,                comment: "ブログの状態"
  end
end
