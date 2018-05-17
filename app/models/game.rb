class Game < ApplicationRecord
  attr_accessor :messages

  belongs_to :player_1, class_name: "User", foreign_key: "player_1"
  belongs_to :player_2, class_name: "User", foreign_key: "player_2"

  enum current_turn: ["challenger", "computer"]
  serialize :player_1_board
  serialize :player_2_board

  validates :player_1_board, presence: true
  validates :player_2_board, presence: true

  def self.create_default
    binding.pry
    create(player_1: challenger, player_2: opponent, player_1_board: Board.new(4),
           player_2_board: Board.new(4))

  end

  def turn_sum
    player_1_turns + player_2_turns
  end

  def challenger
    #find user by api_key
    #maybe have the Player class instantiating with an api_key?
  end

  def opponent
    #find opponent by api_key
  end

end
