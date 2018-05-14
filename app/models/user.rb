class User < ApplicationRecord
  validates_presence_of :name
  validates :email, presence: true, uniqueness: true

  has_secure_password
end
