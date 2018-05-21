class Player
  attr_reader :board, :api_key, :turns

  def initialize(board, api_key)
    @api_key = api_key
    @board = board
  end
end
