class User < ApplicationRecord
  has_secure_password

  validates_presence_of :name
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true, allow_nil: true

  def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save!(:validate => false)
  end

  private

  def generate_email_token
    if self.email_token.blank?
      self.email_token = SecureRandom.hex(10)
    end
  end
end
