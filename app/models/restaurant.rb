class Restaurant < ApplicationRecord
  belongs_to :user
  has_one :report
  has_many :workers, dependent: :destroy
  has_many :floorplans, dependent: :destroy
  has_many :stations, dependent: :destroy
  has_many :notes, dependent: :destro
  validates :user_id, uniqueness: true
end
