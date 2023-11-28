class Article < ApplicationRecord
  serialize :sets, JSON
  def sets=(value)
    self.body = value['body']
    self.article_images = value['article_images']
    super(value)
  end

  def sets
    { 'body' => body, 'article_images' => article_images }
  end
  mount_uploader :article_images, ArticleImagesUploader
  extend Enumerize

  enumerize :category, in: { event: 0, company_trip: 1, staff_introduction: 2, other: 3 }
end
