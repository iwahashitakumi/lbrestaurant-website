class Content < ApplicationRecord
  mount_uploader :article_image, ArticleImageUploader
  belongs_to :article

  validates :body, presence: true
end
