class Content < ApplicationRecord
  belongs_to :article

  mount_uploader :article_image, ArticleImageUploader

  validates :body, presence: true
end
