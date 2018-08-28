class User < ApplicationRecord
  has_secure_password
  has_secure_token :auth_token

  validates_presence_of :name, uniqueness: true, presence: true
  validates_presence_of :password, require: true, allow_nil: true

  validates_presence_of :email, :status

  enum status: ["inactive", "active"]

end
