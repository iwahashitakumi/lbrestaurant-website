class Content < ApplicationRecord
  belongs_to :article

  mount_uploader :article_images, ArticleImagesUploader

  validates :body, presence: true
end
