class Flat < ApplicationRecord
  belongs_to :user
  validates :address, length: { minimum: 4 }
  description :description, length: { minimum: 5 }
end
