class User < ApplicationRecord
  has_secure_password

  validates :apikey, uniqueness: true
  enum status: %w(inactive active)
end
