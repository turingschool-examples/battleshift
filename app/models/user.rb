class User < ApplicationRecord
  validates_presence_of :username, :email, :password
  validates_uniqueness_of :username

  has_secure_password
  has_secure_token :api_token
end
