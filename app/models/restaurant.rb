class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :workers, dependent: :destroy
end
