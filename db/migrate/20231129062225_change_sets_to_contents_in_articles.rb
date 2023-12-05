class ChangeSetsToContentsInArticles < ActiveRecord::Migration[7.0]
  def change
    rename_column :articles, :sets, :contents
  end
end
