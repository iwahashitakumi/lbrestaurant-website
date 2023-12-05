class AddArticleIdToContents < ActiveRecord::Migration[7.0]
  def change
    add_reference :contents, :article, null: false, foreign_key: true,    comment:"contentsテーブルに外部キー(article_id)を追加"
  end
end
