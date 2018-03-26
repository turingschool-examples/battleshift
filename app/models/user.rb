class User < ApplicationRecord
  has_secure_password
  validates_confirmation_of :password
  validates_presence_of :name, :password_confirmation
end
