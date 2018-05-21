class User < ApplicationRecord
  has_secure_password

  validates_presence_of :name, :email
  validates_uniqueness_of :email

  enum status: ['inactive', 'active']

  before_create :key_gen

  def key_gen
    self.api_key = SecureRandom.urlsafe_base64
  end
end
