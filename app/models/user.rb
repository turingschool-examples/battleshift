class User < ApplicationRecord
  validates_presence_of :username, :email, :password, :user_token
  validates_uniqueness_of :username
  validates_confirmation_of :password

  has_secure_password
end
