class Player
  attr_reader :board
  attr_accessor :turn_count

  def initialize(board, turn_count)
    @board = board
    @turn_count = turn_count
  end
end
