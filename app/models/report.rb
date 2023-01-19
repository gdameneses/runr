class Report < ApplicationRecord
  has_one_attached :file
  belongs_to :restaurant
end
