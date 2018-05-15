class User < ApplicationRecord
  has_secure_password
  validates_presence_of :name, :password_digest
  validates :email, presence: true, uniqueness: true
  before_create :set_api_token

  def activate!
    update(activated: true)
  end

  def activated?
    activated
  end


  def self.find_and_activate(id)
    user = find(id)
    user.activate!
    user
  end
  

  private

  def set_api_token
    self.api_key = loop do
      token = SecureRandom.hex(20)
      break token unless User.exists?(api_key: token)
    end
  end
end
