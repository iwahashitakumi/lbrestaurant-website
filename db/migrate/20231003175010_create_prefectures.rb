class CreatePrefectures < ActiveRecord::Migration[7.0]
  def change
    create_table :prefectures do |t|
      t.string :name, default: "", null: false,      comment: "都道府県名"
      t.integer :code, null: false,                  comment: "都道府県コード"

      t.timestamps
    end
  end
end
