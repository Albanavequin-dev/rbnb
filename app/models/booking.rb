class Booking < ApplicationRecord
  belongs_to :flat
  belongs_to :user
  validates :arrival_date, presence: true
  validates :departure_date, presence: true
end
