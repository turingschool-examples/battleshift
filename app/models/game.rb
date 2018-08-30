class Game < ApplicationRecord
  attr_accessor :messages

  enum current_turn: ["player 1", "player 2"]
  serialize :player_1_board
  serialize :player_2_board
  
  validates :player_1_token, presence: true
  validates :player_2_token, presence: true
  
  validates :player_1_board, presence: true
  validates :player_2_board, presence: true
end
