class Station < ApplicationRecord
  has_many :skills
  has_many :workers, through: :skills
end
