class News < ApplicationRecord

  extend Enumerize
  enumerize :state, in: { unpublished: 0, published: 1, expired: 2 }, default: :unpublished, predicates: true, scope: :shallow

  validates :calendar_date, presence: true
  validates :state, presence: true
  validates :title, presence: true, length: { minimum: 5, maximum: 100 }
  validates :start_at, presence: true
  validates :end_at, presence: true
  validates :body, presence: true
  validate :start_at_in_future
  validate :end_at_after_start_at
  
  scope :before_published, -> { where("start_at <= ? AND end_at > ?", Time.current, Time.current) }
  scope :next_expired, -> { where('end_at <= ?', Time.zone.now) }
  scope :search_by_state, ->(state) { where(state: state) }

  def self.ransackable_scopes(auth_object = nil)
    %i(search_by_state)
  end

  def start_at_in_future
    errors.add(:start_at, 'は過去の日時を選択できません') if start_at.present? && start_at < Time.zone.now
  end

  def end_at_after_start_at
    errors.add(:end_at, 'は開始日時より後の日時を選択してください') if start_at.present? && end_at.present? && end_at <= start_at
  end

  def self.ransackable_attributes(auth_object = nil)
    ["title", "body", "state"]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
