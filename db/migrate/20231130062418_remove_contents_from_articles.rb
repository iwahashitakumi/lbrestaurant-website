class RemoveContentsFromArticles < ActiveRecord::Migration[7.0]
  def change
    remove_column :articles, :contents, :json
  end
end
