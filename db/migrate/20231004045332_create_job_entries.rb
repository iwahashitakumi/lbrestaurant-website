class CreateJobEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :job_entries do |t|
      t.integer :recruit_type, null: false,                                  comment: "希望雇用形態"
      t.string :name, default: "", null: false,                              comment: "応募者の名前"
      t.string :name_kana, default: "", null: false,                         comment: "応募者の名前(カナ)"
      t.string :phone_number, default: "", null: false,                      comment: "応募者の電話番号"
      t.string :email, default: "", null: false,                             comment: "応募者のメールアドレス"
      t.date :birth_date, null: false,                                       comment: "応募者の生年月日"
      t.integer :sex, null: false,                                           comment: "応募者の性別"
      t.string :city_name, default: "", null: false,                         comment: "応募者の市町村区"
      t.string :address, default: "", null: false,                           comment: "応募者の番地等"
      t.integer :status, null: false,                                        comment: "応募者の処理状況"
      t.references :prefecture, null: false, foreign_key: true,              comment: "応募者の都道府県id"
      t.integer :update_by, null: true,                                      comment: "更新者(外部キー)"

      t.timestamps
    end
  end
end
