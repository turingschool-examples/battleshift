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
    if user.id == player_1.id
      update(current_turn: 1)
    elsif user.id == player_2.id
      update(current_turn: 0)
    end
  end
end
