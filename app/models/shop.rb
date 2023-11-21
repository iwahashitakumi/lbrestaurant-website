class Shop < ApplicationRecord
  mount_uploader :shop_images, ShopImagesUploader
  
end
