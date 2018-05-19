class User < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :email
  validates_uniqueness_of :email

  has_secure_password

  before_save do
    if self.activation_key.nil?
      self.activation_key = rand(36**32).to_s(32).upcase
      save
    end
    if self.api_key.nil?
      self.api_key = rand(36**32).to_s(32).upcase
      save
    end
  end
end
