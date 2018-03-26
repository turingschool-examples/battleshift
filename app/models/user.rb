class User < ApplicationRecord
  has_secure_password
  validates_confirmation_of :password, on: :create
  validates_presence_of :name, :password_confirmation, on: :create
  enum status: %w(inactive active)
end
