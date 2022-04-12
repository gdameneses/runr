class Station < ApplicationRecord
  has_many :skills, dependent: :destroy
  has_many :workers, through: :skills
end
