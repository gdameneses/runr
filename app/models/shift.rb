class Shift < ApplicationRecord
  belongs_to :report
  belongs_to :worker
  belongs_to :restaurant
end
