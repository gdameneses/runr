class Skill < ApplicationRecord
  belongs_to :worker
  belongs_to :station
end
