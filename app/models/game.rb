class Game < ApplicationRecord

  # TODO: create validations for appropriate game_attributes

  attr_accessor :messages

  enum current_turn: ["player_1", "player_2"]
  serialize :player_1_board
  serialize :player_2_board

  validates :player_1_board, presence: true
  validates :player_2_board, presence: true
end
