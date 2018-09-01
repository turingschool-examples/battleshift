class Game < ApplicationRecord
  belongs_to :player_1, class_name: "User", foreign_key: "player_1_id"
  belongs_to :player_2, class_name: "User", foreign_key: "player_2_id"
  attr_accessor :messages

  enum current_turn: ["player 1", "player 2"]

  serialize :player_1_board
  serialize :player_2_board

  validates :player_1_id, presence: true
  validates :player_2_id, presence: true

  validates :player_1_board, presence: true
  validates :player_2_board, presence: true

  def turn_switcher(user)
    if user == player_1
      update(current_turn: 1)
    elsif user == player_2
      update(current_turn: 0)
    end
  end
  
  def current_turn_user
    if current_turn == "player 1"
      player_1
    else
      player_2
    end
  end
end
