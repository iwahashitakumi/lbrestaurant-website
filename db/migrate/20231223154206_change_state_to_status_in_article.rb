class ChangeStateToStatusInArticle < ActiveRecord::Migration[7.0]
  def change
    rename_column :articles, :state, :status
  end
end
