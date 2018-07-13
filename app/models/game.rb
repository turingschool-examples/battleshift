class Game < ApplicationRecord
  attr_reader :message

  enum current_turn: ["player 1", "player 2"]
  serialize :player_1_board
  serialize :player_2_board

  validates :player_1_board, presence: true
  validates :player_2_board, presence: true

  belongs_to :player_1, class_name: "User"
  belongs_to :player_2, class_name: "User", required: false

  def set_message(message)
    @message = message
  end
end
