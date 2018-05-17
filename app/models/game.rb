class Game < ApplicationRecord
  attr_accessor :messages

  belongs_to :player_1, class_name: "User", foreign_key: "player_1"
  belongs_to :player_2, class_name: "User", foreign_key: "player_2"

  enum current_turn: ["challenger", "computer"]
  serialize :player_1_board
  serialize :player_2_board

  validates :player_1_board, presence: true
  validates :player_2_board, presence: true

  def self.create_default(params, headers)
    create(player_1: challenger(headers),
           player_2: opponent(params),
           player_1_board: Board.new(4),
           player_2_board: Board.new(4))

  end

  def turn_sum
    player_1_turns + player_2_turns
  end

  private

  def self.challenger(headers)
    User.find_by_api_key(headers['X-API-key'])
  end

  def self.opponent(params)
    User.find_by_email(params[:opponent_email])
  end

end
