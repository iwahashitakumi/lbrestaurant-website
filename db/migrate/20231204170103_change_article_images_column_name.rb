class ChangeArticleImagesColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :contents, :article_images, :article_image
  end
end
