class CreateContents < ActiveRecord::Migration[7.0]
  def change
    create_table :contents do |t|
      t.text :body, null: false,                   comment:"ブログの内容"
      t.string :article_images, null:true,         comment:"ブログの画像"

      t.timestamps
    end
  end
end
