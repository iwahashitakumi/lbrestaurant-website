class Article < ApplicationRecord
  mount_uploader :article_images, ArticleImagesUploader
  extend Enumerize

  enumerize :category, in: { event: 0, company_trip: 1, staff_introduction: 2, other: 3 }
end
