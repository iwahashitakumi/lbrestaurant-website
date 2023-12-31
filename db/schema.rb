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

ActiveRecord::Schema[7.0].define(version: 2023_12_31_085337) do
  create_table "admins", charset: "utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", default: "", null: false
    t.integer "role", null: false, comment: "管理者の役割"
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "articles", charset: "utf8", force: :cascade do |t|
    t.string "title", default: "", null: false
    t.datetime "start_at", null: false
    t.datetime "end_at", null: false
    t.integer "category", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", null: false, comment: "ブログの状態"
  end

  create_table "contacts", charset: "utf8", force: :cascade do |t|
    t.integer "contact_type", null: false
    t.text "message", null: false
    t.string "name", default: "", null: false
    t.string "name_kana", default: "", null: false
    t.string "email", default: "", null: false
    t.string "phone_number", default: "", null: false
    t.boolean "callback_requested", null: false
    t.integer "contact_method", null: false
    t.integer "status", null: false
    t.bigint "update_by"
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
    t.integer "recruit_type", null: false
    t.string "name", default: "", null: false
    t.string "name_kana", default: "", null: false
    t.string "phone_number", default: "", null: false
    t.string "email", default: "", null: false
    t.date "birth_date", null: false
    t.integer "sex", null: false
    t.string "city_name", default: "", null: false
    t.string "address", default: "", null: false
    t.integer "status", null: false
    t.bigint "prefecture_id", null: false
    t.bigint "update_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["prefecture_id"], name: "index_job_entries_on_prefecture_id"
    t.index ["update_by"], name: "fk_rails_d213f37d18"
  end

  create_table "news", charset: "utf8", force: :cascade do |t|
    t.date "calendar_date", null: false
    t.string "title", default: "", null: false
    t.datetime "start_at", null: false
    t.datetime "end_at", null: false
    t.text "body", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", null: false, comment: "お知らせの状態"
  end

  create_table "prefectures", charset: "utf8", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.integer "code", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shops", charset: "utf8", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "address", default: "", null: false
    t.text "access", null: false
    t.text "business_time", null: false
    t.string "phone_number", default: "", null: false
    t.integer "counter_seat", null: false
    t.integer "table_seat", null: false
    t.string "site_name", default: "", null: false
    t.text "gourmet_site_link", null: false
    t.string "shop_image"
    t.string "city_name", default: "", null: false
    t.bigint "prefecture_id", null: false
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
