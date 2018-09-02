class User < ApplicationRecord

  validates :email, uniqueness: true, presence: true
  validates_presence_of :name, require: true
  validates_presence_of :status, require: true

  validates_presence_of :password_digest, require: true
  validates_confirmation_of :password

  enum status: [:inactive, :active]

  has_secure_password
  has_secure_token :user_token

  has_many :games, class_name: "Game", foreign_key: "player_1_id"
  has_many :games, class_name: "Game", foreign_key: "player_2_id"
end
