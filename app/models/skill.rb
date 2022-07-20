class Skill < ApplicationRecord
  belongs_to :worker
  belongs_to :station
  validates :level, numericality: { greater_than: 0 } && { less_than_or_equal_to: 5 }
end
