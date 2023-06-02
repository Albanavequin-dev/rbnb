class Flat < ApplicationRecord
  has_one_attached :image

  belongs_to :user
  validates :name, presence: true, uniqueness: true
  validates :address, presence: true, length: { minimum: 4 }
  validates :description, length: { minimum: 5 }
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  validates_presence_of :image
end
