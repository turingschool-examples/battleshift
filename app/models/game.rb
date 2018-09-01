class Game < ApplicationRecord
  attr_accessor :messages

  enum current_turn: ["player_1", "player_2"]
  serialize :player_1_board
  serialize :player_2_board

  validates :player_1_board, presence: true
  validates :player_2_board, presence: true

  def validate_turn(auth_token)
    if auth_token == self.player_1_auth_token && current_turn == "player_1" || auth_token == self.player_2_auth_token && current_turn == "player_2"
      return true
    else
      return "Invalid move. It's your opponent's turn"
    end
  end

  def change_turns
    if self.current_turn == "player_1"
      self.update(current_turn: "player_2")
    elsif self.current_turn == "player_2"
      self.update(current_turn: "player_1")
    end
  end
end
