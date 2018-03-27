class User < ApplicationRecord
  has_secure_password
  validates_presence_of :password, :email, :name
  validates_confirmation_of :password, message: "Passwords must match like butter and astroturf"
  validates_uniqueness_of :email
  enum status: [:inactive, :active]
  has_many :colosseums
  has_many :games, through: :colosseums
end
