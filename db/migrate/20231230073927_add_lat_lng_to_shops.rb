class AddLatLngToShops < ActiveRecord::Migration[7.0]
  def change
    add_column :shops, :latitude, :float, null: true,        comment: "店舗の緯度"
    add_column :shops, :longitude, :float, null: true,        comment: "管理者の経度"
  end
end
