class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title, default: '', null: false,                                     comment: "ブログ記事のタイトル"
      t.datetime :start_at, null: false,                                             comment: "ブログ記事の公開開始時間"
      t.datetime :end_at, null: false,                                               comment: "ブログ記事の公開終了時間"
      t.text :body, default: '', null: false,                                        comment: "ブログ記事の内容"
      t.string :article_images, default: '',                                         comment: "ブログ記事の画像時間"
      t.text :sets, default: '[{"body": "", "article_images": ""}]', null: false,    comment: "セット情報"
      t.integer :category, null: false,                                              comment: "ブログ記事のカテゴリー"

      t.timestamps
    end
  end
end
