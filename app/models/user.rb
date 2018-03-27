class User < ApplicationRecord
  has_secure_password
  validates_presence_of :name, :email, :password, :status
  has_one :activation_key
  has_one :api_key
  enum status: ["inactive", "active"]

  def generate_api_key(user)
    {api_key: (rand(10 ** 20).to_s + (user.id).to_s)}
  end

  def assign_api_key(user)
    ApiKey.create(user_id: user.id, api_key: generate_api_key(user)[:api_key])
  end
end
