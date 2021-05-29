class Instrument < ApplicationRecord
  CATEGORIES = %w[brass keyboard percussion string woodwind].freeze
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
  has_many :bookings, dependent: :destroy
  has_one_attached :photo
  validates :name, presence: true
  validates :model, presence: true
  validates :category, inclusion: { in: CATEGORIES, allow_nil: false }
  validates :year, presence: true
  validates :address, presence: true

  validates :rate, presence: true, numericality: {
    greater_than_or_equal_to: 0
  }
  has_many :bookings

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_by_name_model_category,
    against: {
      name: 'A',
      category: 'B',
      model: 'C'
    },
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
