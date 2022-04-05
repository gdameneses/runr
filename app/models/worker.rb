class Worker < ApplicationRecord
  belongs_to :restaurant
  has_many :skills
  has_many :stations, through: :skills
end
