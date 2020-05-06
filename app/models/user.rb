class User < ApplicationRecord
  has_secure_password
  has_many :todos

  validates :fname, presence: true
  validates :email, presence: true
  validates :password, presence: true
end
