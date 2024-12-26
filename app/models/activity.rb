class Activity < ApplicationRecord
  belongs_to :board
  has_many :contributions, dependent: :destroy
end
