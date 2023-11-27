class AddDiscardedAtToShops < ActiveRecord::Migration[7.0]
  def change
    add_column :shops, :discarded_at, :datetime,                         comment: "店舗管理の論理削除機能"
    add_index :shops, :discarded_at
  end
end
