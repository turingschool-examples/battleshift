class User < ApplicationRecord
    has_secure_password
    validates_presence_of :password, on: :create
    validates_confirmation_of :password
    validates_presence_of :name
    validates :email, presence: true, uniqueness: true

    def generate_api_key
      self.api_key = SecureRandom.urlsafe_base64
      save
    end 
end
