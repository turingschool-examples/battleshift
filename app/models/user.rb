class User < ApplicationRecord
  has_secure_password
  validates_presence_of :name, :email 

  validates :password, presence: true, on: :create
  validates_confirmation_of :password, on: :create
end
