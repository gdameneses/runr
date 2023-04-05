class Worker < ApplicationRecord
  belongs_to :restaurant
  has_many :shift, dependent: :delete_all
  has_many :skills, dependent: :destroy
  has_many :stations, through: :skills

  def to_label
    "#{self.first_name} #{self.last_name}"
  end
end
