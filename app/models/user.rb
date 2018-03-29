class User < ApplicationRecord
  has_secure_password
  validates_presence_of :name, :email, :password, :status
  has_one :activation_key
  has_one :api_key
  has_many :game_players
  has_many :games, through: :game_players
  enum status: ["inactive", "active"]

  def generate_key
    (rand(10 ** 20).to_s + (id).to_s)
  end

  def assign_api_key
    self.create_api_key(api_key: generate_key)
  end

  def assign_activation_key
    self.create_activation_key(activation_key: generate_key)
  end
end
