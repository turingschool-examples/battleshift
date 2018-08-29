class Game < ApplicationRecord
  attr_accessor :messages

  enum current_turn: ["challenger", "challenger"]
  serialize :player_1_board
  serialize :player_2_board
  
  validates :challenger_token, presence: true
  validates :opponent_token, presence: true
  
  validates :player_1_board, presence: true
  validates :player_2_board, presence: true
end
