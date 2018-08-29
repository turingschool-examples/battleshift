class Game < ApplicationRecord
  attr_accessor :messages

  enum current_turn: ["player_one", "player_two"]
  serialize :player_1_board
  serialize :player_2_board

  validates :player_1_board, presence: true
  validates :player_2_board, presence: true
end
