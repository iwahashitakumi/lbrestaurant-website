class ChangeCounterAndTableSeatsAndShopImagesColumnNames < ActiveRecord::Migration[7.0]
  def change
    rename_column :shops, :counter_seats, :counter_seat
    rename_column :shops, :table_seats, :table_seat
    rename_column :shops, :shop_images, :shop_image
  end
end
