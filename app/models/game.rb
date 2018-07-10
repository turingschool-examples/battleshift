class Game < ApplicationRecord
  attr_reader :message

  enum current_turn: ["challenger", "computer"]
  serialize :player_1_board
  serialize :player_2_board

  validates :player_1_board, presence: true
  validates :player_2_board, presence: true

  def set_message(message)
    @message = message
  end
end
