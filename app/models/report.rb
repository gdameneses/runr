class Report < ApplicationRecord
  has_one_attached :report
  belongs_to :restaurant
end
