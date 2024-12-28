class Board < ApplicationRecord
  encrypts :password

  has_many :users, dependent: :destroy
  has_many :activities, dependent: :destroy
  has_many :contributions, through: :activities

  def authenticated?(value)
    password == value
  end
end
