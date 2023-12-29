class Article < ApplicationRecord
  has_many :contents, dependent: :destroy
  accepts_nested_attributes_for :contents, allow_destroy: true
  extend Enumerize

  enumerize :category, in: { event: 1, company_trip: 2, staff_introduction: 3, other: 4 }
  enumerize :status, in: { unpublished: 1, published: 2, expired: 3 }, default: :unpublished, scope: true, predicates: true

  validates :category, presence: true
  validates :status, presence: true
  validates :title, presence: true, length: { minimum: 5, maximum: 100 }
  validates :start_at, presence: true
  validates :end_at, presence: true
  validate :start_at_in_future
  validate :end_at_after_start_at

  scope :before_published, -> { where("start_at <= ? AND end_at > ?", Time.zone.now, Time.zone.now) }
  scope :next_expired, -> { where('end_at <= ?', Time.zone.now) }
  scope :search_by_category, ->(category) { where(category: category) }
  scope :search_by_status, ->(status) { where(status: status) }

  def self.ransackable_scopes(auth_object = nil)
    %i(search_by_category search_by_status)
  end

  def start_at_in_future
    errors.add(:start_at, 'は過去の日時を選択できません') if start_at.present? && start_at < Time.zone.now
  end

  def end_at_after_start_at
    errors.add(:end_at, 'は開始日時より後の日時を選択してください') if start_at.present? && end_at.present? && end_at <= start_at
  end

  def self.ransackable_attributes(auth_object = nil)
    ["title", "category", "status"]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
