class User < ApplicationRecord
  validates_presence_of :name, :password_digest
  validates :email, presence: true, uniqueness: true

  has_secure_password
  
  def activate!
    update(activated: true)
  end

  def activated?
    activated
  end

  class << self

    def find_and_activate(id)
      user = find(id)
      user.activate!
      user
    end

  end
end
