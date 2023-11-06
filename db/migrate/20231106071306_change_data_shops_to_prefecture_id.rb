class ChangeDataShopsToPrefectureId < ActiveRecord::Migration[7.0]
  def change
    change_column :shops, :prefecture_id, :bigint
  end
end
