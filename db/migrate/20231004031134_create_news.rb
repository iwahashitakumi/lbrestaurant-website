class CreateNews < ActiveRecord::Migration[7.0]
  def change
    create_table :news do |t|
      t.date :calendar_date, null: false,                comment: "お知らせ日"
      t.string :title, default: "", null: false,         comment: "お知らせタイトル"
      t.datetime :start_at, null: false,                 comment: "お知らせ公開開始日"
      t.datetime :end_at, null: false,                   comment: "お知らせ日公開終了日"
      t.text :body, null: false,                         comment: "お知らせ内容"

      t.timestamps
    end
  end
end
