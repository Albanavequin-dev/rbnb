class Flat < ApplicationRecord
  belongs_to :user
  validates :address, length: { minimum: 4 }
  validates :description, length: { minimum: 5 }
end
