class User < ApplicationRecord
  has_secure_password
  validates :email, :username, presence: true, uniqueness: true
  validates :password, presence: true
  before_save :set_keys

  def activate(url_token)
    if url_token == self.token
      self.active = true
    end
  end

  private
    def set_keys
      self.api_key = generate_key
      self.token = generate_key
    end

    def generate_key
      SecureRandom.urlsafe_base64
    end
end
