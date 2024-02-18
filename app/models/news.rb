class News < ApplicationRecord
  extend Enumerize
  enumerize :status, in: { unpublished: 1, published: 2, expired: 3 }, default: :unpublished, predicates: true, scope: true

  with_options presence: true do
    validates :calendar_date
    validates :status
    validates :title, length: { minimum: 5, maximum: 100 }
    validates :start_at
    validates :end_at
    validates :body
  end
  validate :start_at_in_future
  validate :end_at_after_start_at

  scope :before_published, -> { where("start_at <= ? AND end_at > ?", Time.zone.now, Time.zone.now) }
  scope :next_expired, -> { where('end_at <= ?', Time.zone.now) }
  scope :search_by_status, ->(status) { where(status: status) }

  def self.ransackable_scopes(auth_object = nil)
    %i(search_by_status)
  end

  def start_at_in_future
    errors.add(:start_at, 'は過去の日時を選択できません') if start_at.present? && start_at < Time.zone.now
  end

  def end_at_after_start_at
    errors.add(:end_at, 'は開始日時より後の日時を選択してください') if start_at.present? && end_at.present? && end_at <= start_at
  end

  def self.ransackable_attributes(auth_object = nil)
    ["title", "body", "status"]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
