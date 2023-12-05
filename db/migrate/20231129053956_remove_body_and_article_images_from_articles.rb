class RemoveBodyAndArticleImagesFromArticles < ActiveRecord::Migration[7.0]
  def change
    remove_column :articles, :body, :text, null: false
    remove_column :articles, :article_images, :string, default: ""
  end
end
