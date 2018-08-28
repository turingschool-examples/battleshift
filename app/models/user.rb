class User < ApplicationRecord
  validates_presence_of :name, :status
  validates_presence_of :password, require: true
  validates :password, confirmation: { case_sensitive: true }
  validates :email, uniqueness: true, presence: true
  has_secure_password

end
