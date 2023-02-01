class Shift < ApplicationRecord
  belongs_to :report
  belongs_to :worker
  belongs_to :restaurant
  validates :start, presence: true
  validates :finish, presence: true
end
