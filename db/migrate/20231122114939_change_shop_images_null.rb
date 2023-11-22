class ChangeShopImagesNull < ActiveRecord::Migration[7.0]
  def change
    change_column :shops, :shop_images, :string, null: true
  end
end
