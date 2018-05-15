class User < ApplicationRecord
  validates_presence_of :name, :email, :password
  validates_uniqueness_of :email
  has_secure_password
  enum status: ['inactive', 'active']
  before_save :key_gen

  def key_gen
    self.api_key = SecureRandom.urlsafe_base64
  end
end
