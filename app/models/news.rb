class News < ApplicationRecord

  extend Enumerize
  enumerize :state, in: { unpublished: 0, published: 1, expired: 2 }, default: :unpublished, scope: true, predicates: true

  validates :calendar_date, presence: true
  validates :title, presence: true, length: { minimum: 5, maximum: 100 }
  validates :start_at, presence: true
  validates :end_at, presence: true
  validates :body, presence: true
  validate :start_at_in_future
  validate :end_at_after_start_at
  

  def start_at_in_future
    errors.add(:start_at, 'は過去の日時を選択できません') if start_at.present? && start_at < Time.zone.now
  end

  def end_at_after_start_at
    errors.add(:end_at, 'は開始日時より後の日時を選択してください') if start_at.present? && end_at.present? && end_at <= start_at
  end

  def self.ransackable_attributes(auth_object = nil)
    ["title", "body"]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
