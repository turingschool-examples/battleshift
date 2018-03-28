class Player
  attr_reader :board, :turns, :api_key

  def initialize(board, api_key)
    @board = board
    @turns = 0
    @api_key = api_key
  end
end
