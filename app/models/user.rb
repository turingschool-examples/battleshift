class User < ApplicationRecord
  has_secure_password
  has_secure_token :auth_token

  validates_presence_of :name, uniqueness: true, presence: true
  validates_presence_of :password, require: true, allow_nil: true
  validates_presence_of :email, uniqueness: true

  validates_presence_of :status

  has_many :games, class_name: 'Game', foreign_key: 'player_1_id', dependent: :destroy
  has_many :games, class_name: 'Game', foreign_key: 'player_2_id', dependent: :destroy

  enum status: [:inactive, :active]

  def confirm_registration
    update_attributes(status: "active") if self.status == "inactive"
  end
end
