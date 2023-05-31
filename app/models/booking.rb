class Booking < ApplicationRecord
  belongs_to :flat
  belongs_to :user
  validates :arrival_date, presence: true
  validates :departure_date, presence: true
  validate :dates_must_be_in_future

  def dates_must_be_in_future
    if arrival_date.present? && arrival_date < Date.today
      errors.add(:arrival_date, " cannot be in the past")
    end

    if departure_date.present? && departure_date < arrival_date
      errors.add(:departure_date, " date cannot be before the arrival date")
    end
  end
end
