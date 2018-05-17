class Game < ApplicationRecord
  attr_accessor :messages

  enum current_turn: ["challenger", "computer"]
  serialize :player_1_board
  serialize :player_2_board

  validates :player_1_board, presence: true
  validates :player_2_board, presence: true

  def self.create_default
    create(player_1_board: Board.new(4),
           player_2_board: Board.new(4),
           current_turn: 'challenger')

  end

  def turn_sum
    player_1_turns + player_2_turns
  end
end
