class CreateContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :contacts do |t|
      t.integer :contact_type, null: false,                         comment: "問い合わせの種類"
      t.text :message, null: false,                                 comment: "問い合わせの内容"
      t.string :name, default: "", null: false,                     comment: "問い合わせ者の名前"
      t.string :name_kana, default: "", null: false,                comment: "問い合わせ者の名前(カナ)"
      t.string :email, default: "", null: false,                    comment: "問い合わせのメールアドレス"
      t.string :phone_number, default: "", null: false,             comment: "問い合わせの電話番号"
      t.integer :callback_requested, null: false,                   comment: "返信の有無"
      t.integer :contact_method, null: false,                       comment: "返信方法"
      t.integer :status, null: false,                               comment: "問い合わせの対応状態"
      t.bigint :update_by, null: true,                             comment: "更新者(外部キー)"

      t.timestamps
    end
  end
end
