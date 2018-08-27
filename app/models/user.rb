class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates_presence_of :password, require: true
  validates_presence_of :name, require: true
  validates_presence_of :status, require: true
  enum status: [:inactive, :active]
  has_secure_password
  has_secure_token :user_token
end