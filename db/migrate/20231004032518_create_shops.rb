class CreateShops < ActiveRecord::Migration[7.0]
  def change
    create_table :shops do |t|
      t.string :name, default: "", null: false,                               comment: "店舗名"
      t.string :address, default: "", null: false,                            comment: "店舗の番地"
      t.text :access, null: false,                                            comment: "店舗へのアクセス"
      t.text :business_time, null: false,                                     comment: "店舗の営業時間"
      t.string :phone_number, default: "", null: false,                       comment: "店舗の電話番号"
      t.integer :counter_seats, null: false,                                  comment: "店舗のカウンター席数"
      t.integer :table_seats, null: false,                                    comment: "店舗のテーブル席数"
      t.string :site_name, default: "", null: false,                          comment: "店舗のグルメサイトの名前"
      t.text :gourmet_site_link, null: false,                                 comment: "店舗のグルメサイトのリンク"
      t.string :shop_images, null: false,                                     comment: "店舗の画像"
      t.string :city_name, default: "", null: false,                          comment: "店舗の市町村区"
      t.references :prefecture, null: false, foreign_key: true,               comment: "店舗の都道府県テーブルid"

      t.timestamps
    end
  end
end
