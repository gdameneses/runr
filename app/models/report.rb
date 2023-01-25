class Report < ApplicationRecord
  has_one_attached :file
  has_many :shifts
  belongs_to :restaurant
end
