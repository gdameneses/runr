class Report < ApplicationRecord
  has_one_attached :file
  has_many :shifts, dependent: :delete_all
  belongs_to :restaurant
end
