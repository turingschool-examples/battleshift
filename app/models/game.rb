class Game < ApplicationRecord
  attr_accessor :messages

  belongs_to :player_1, class_name: "User", foreign_key: "player_1"
  belongs_to :player_2, class_name: "User", foreign_key: "player_2"
  alias_attribute :p1, :player_1
  alias_attribute :p2, :player_2
  alias_attribute :p1_board, :player_1_board
  alias_attribute :p2_board, :player_2_board

  enum current_turn: ["challenger", "computer"]
  serialize :player_1_board
  serialize :player_2_board

  validates :player_1_board, presence: true
  validates :player_2_board, presence: true

  def self.create_default(params, headers)
    create(player_1: challenger(headers),
           player_2: opponent(params),
           player_1_board: Board.new(4),
           player_2_board: Board.new(4),
           current_turn: 1)

  end

  def turn_sum
    player_1_turns + player_2_turns
  end

  def invalid_turn?(key)
    case current_turn
    when 'computer'   then key == p2.api_key 
    when 'challenger' then key == p1.api_key
    end
  end

  def cycle_turn
    case self.current_turn
    when 'challenger' then self.current_turn = 'computer'; save
    when 'computer'   then self.current_turn = 'challenger'; save
    end
  end

  def in_progress?
    winner.nil?
  end

  private

  def self.challenger(headers)
    User.find_by_api_key(headers['X-API-key'])
  end

  def self.opponent(params)
    User.find_by_email(params[:opponent_email])
  end

end
