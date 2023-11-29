class Article < ApplicationRecord
  def contents
    { 'body' => body, 'article_images' => article_images }
  end
  mount_uploader :article_images, ArticleImagesUploader
  extend Enumerize

  enumerize :category, in: { event: 0, company_trip: 1, staff_introduction: 2, other: 3 }

  validates :category, presence: true
  validates :title, presence: true, length: { minimum: 5, maximum: 100 }
  validates :start_at, presence: true
  validates :end_at, presence: true
  validates :contents, presence: true
  validate :start_at_in_future
  validate :end_at_after_start_at

  def start_at_in_future
    errors.add(:start_at, 'は過去の日時を選択できません') if start_at.present? && start_at < Time.zone.now
  end

  def end_at_after_start_at
    errors.add(:end_at, 'は開始日時より後の日時を選択してください') if start_at.present? && end_at.present? && end_at <= start_at
  end
end
