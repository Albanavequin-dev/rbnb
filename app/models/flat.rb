class Flat < ApplicationRecord
  has_one_attached :image

  belongs_to :user
  validates :name, presence: true, uniqueness: true, length: { minimum: 4 }
  validates :address, presence: true, uniqueness: true, length: { minimum: 4 }
  validates :description, length: { minimum: 15 }
end
