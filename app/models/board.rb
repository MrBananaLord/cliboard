class Board < ApplicationRecord
  encrypts :password

  has_many :users

  def authenticated?(value)
    password == value
  end
end
