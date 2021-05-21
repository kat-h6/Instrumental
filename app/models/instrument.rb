class Instrument < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
  has_one_attached :photo
  validates :name, presence: true
  validates :model, presence: true
  validates :category, presence: true
  validates :year, presence: true
  validates :address, presence: true

  validates :rate, presence: true, numericality: {
  	greater_than_or_equal_to: 0
  }
  has_many :bookings

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
