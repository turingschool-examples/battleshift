class User < ApplicationRecord
  has_secure_password

  enum status: %w(inactive active)
end
