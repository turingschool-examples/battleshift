class User < ApplicationRecord
  has_secure_password
  validates :email, :username, presence: true, uniqueness: true
  validates :password, presence: true
  before_save :set_api_key

  private
    def set_api_key
      self.api_key = generate_api_key
    end

    def generate_api_key
      SecureRandom.urlsafe_base64
    end
end
