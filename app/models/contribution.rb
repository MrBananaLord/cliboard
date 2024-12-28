class Contribution < ApplicationRecord
  belongs_to :activity
  belongs_to :user
  has_many :reactions
end
