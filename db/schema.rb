# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_01_08_105958) do
  create_table "admins", charset: "utf8", force: :cascade do |t|
    t.string "email", default: "", null: false, comment: "管理者のメールアドレス"
    t.string "encrypted_password", default: "", null: false, comment: "管理者のパスワード"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", default: "", null: false, comment: "管理者の名前"
    t.integer "role", null: false, comment: "管理者の役割"
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "articles", charset: "utf8", force: :cascade do |t|
    t.string "title", default: "", null: false, comment: "ブログ記事のタイトル"
    t.datetime "start_at", null: false, comment: "ブログ記事の公開開始時間"
    t.datetime "end_at", null: false, comment: "ブログ記事の公開終了時間"
    t.integer "category", null: false, comment: "ブログ記事のカテゴリー"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", null: false, comment: "ブログの状態"
  end

  create_table "contacts", charset: "utf8", force: :cascade do |t|
    t.integer "contact_type", null: false, comment: "問い合わせの種類"
    t.text "message", null: false, comment: "問い合わせの内容"
    t.string "name", default: "", null: false, comment: "問い合わせ者の名前"
    t.string "name_kana", default: "", null: false, comment: "問い合わせ者の名前(カナ)"
    t.string "email", default: "", null: false, comment: "問い合わせのメールアドレス"
    t.string "phone_number", default: "", null: false, comment: "問い合わせの電話番号"
    t.integer "callback_requested", null: false, comment: "返信の有無"
    t.integer "contact_method", null: false, comment: "返信方法"
    t.integer "status", null: false, comment: "問い合わせの対応状態"
    t.bigint "update_by", comment: "更新者(外部キー)"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["update_by"], name: "fk_rails_281088f36f"
  end

  create_table "contents", charset: "utf8", force: :cascade do |t|
    t.text "body", null: false, comment: "ブログの内容"
    t.string "article_image", comment: "ブログの画像"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "article_id", null: false, comment: "contentsテーブルに外部キー(article_id)を追加"
    t.index ["article_id"], name: "index_contents_on_article_id"
  end

  create_table "job_entries", charset: "utf8", force: :cascade do |t|
    t.integer "recruit_type", null: false, comment: "希望雇用形態"
    t.string "name", default: "", null: false, comment: "応募者の名前"
    t.string "name_kana", default: "", null: false, comment: "応募者の名前(カナ)"
    t.string "phone_number", default: "", null: false, comment: "応募者の電話番号"
    t.string "email", default: "", null: false, comment: "応募者のメールアドレス"
    t.date "birth_date", null: false, comment: "応募者の生年月日"
    t.integer "sex", null: false, comment: "応募者の性別"
    t.string "city_name", default: "", null: false, comment: "応募者の市町村区"
    t.string "address", default: "", null: false, comment: "応募者の番地等"
    t.integer "status", null: false, comment: "応募者の処理状況"
    t.bigint "prefecture_id", null: false, comment: "応募者の都道府県id"
    t.bigint "update_by", comment: "更新者(外部キー)"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["prefecture_id"], name: "index_job_entries_on_prefecture_id"
    t.index ["update_by"], name: "fk_rails_d213f37d18"
  end

  create_table "news", charset: "utf8", force: :cascade do |t|
    t.date "calendar_date", null: false, comment: "お知らせ日"
    t.string "title", default: "", null: false, comment: "お知らせタイトル"
    t.datetime "start_at", null: false, comment: "お知らせ公開開始日"
    t.datetime "end_at", null: false, comment: "お知らせ日公開終了日"
    t.text "body", null: false, comment: "お知らせ内容"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", null: false, comment: "お知らせの状態"
  end

  create_table "prefectures", charset: "utf8", force: :cascade do |t|
    t.string "name", default: "", null: false, comment: "都道府県名"
    t.integer "code", null: false, comment: "都道府県コード"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shops", charset: "utf8", force: :cascade do |t|
    t.string "name", default: "", null: false, comment: "店舗名"
    t.string "address", default: "", null: false, comment: "店舗の番地"
    t.text "access", null: false, comment: "店舗へのアクセス"
    t.text "business_time", null: false, comment: "店舗の営業時間"
    t.string "phone_number", default: "", null: false, comment: "店舗の電話番号"
    t.integer "counter_seat", null: false, comment: "店舗のカウンター席数"
    t.integer "table_seat", null: false, comment: "店舗のテーブル席数"
    t.string "site_name", default: "", null: false, comment: "店舗のグルメサイトの名前"
    t.text "gourmet_site_link", null: false, comment: "店舗のグルメサイトのリンク"
    t.string "shop_image", comment: "店舗の画像"
    t.string "city_name", default: "", null: false, comment: "店舗の市町村区"
    t.bigint "prefecture_id", null: false, comment: "店舗の都道府県テーブルid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "discarded_at", comment: "店舗管理の論理削除機能"
    t.string "postcode", null: false, comment: "店舗の郵便番号"
    t.string "google_map_iframe", comment: "Google Map Iframe"
    t.index ["discarded_at"], name: "index_shops_on_discarded_at"
    t.index ["prefecture_id"], name: "index_shops_on_prefecture_id"
  end

  add_foreign_key "contacts", "admins", column: "update_by"
  add_foreign_key "contents", "articles"
  add_foreign_key "job_entries", "admins", column: "update_by"
  add_foreign_key "job_entries", "prefectures"
  add_foreign_key "shops", "prefectures"
end
