class Game < ApplicationRecord
  attr_accessor :messages

  enum current_turn: ["challenger", "player"]
  # serialize :player_1_board
  # serialize :player_2_board

  validates :player_1_id, presence: true
  validates :player_2_id, presence: true

  belongs_to :player_1_id, class_name: 'User'
  belongs_to :player_2_id, class_name: 'User'
  has_many :boards
  has_many :spaces, through: :boards
end
