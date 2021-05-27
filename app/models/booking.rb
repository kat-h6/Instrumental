class Booking < ApplicationRecord
  enum status: [:pending, :accepted, :rejected]
  belongs_to :instrument
  belongs_to :renter, class_name: 'User', foreign_key: 'renter_id'
  has_many :reviews, dependent: :destroy


  validates :price, presence: true, numericality: {
    greater_than_or_equal_to: 0
  }

  validates :start_date, :end_date, presence: true
  validate :end_date_after_start_date

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end
end
