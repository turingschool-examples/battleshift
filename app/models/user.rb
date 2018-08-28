class User < ApplicationRecord
  has_secure_password 

  validates_presence_of :name
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true, allow_nil: true
end

