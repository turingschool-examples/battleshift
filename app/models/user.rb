class User < ApplicationRecord
  has_secure_password
  validates_presence_of :name, :email, :password, :status
  has_one :activation_key
  enum status: ["inactive", "active"]
end
