class Space
  attr_reader :coordinates, :status, :contents

  def initialize(coordinates, board)
    @coordinates = coordinates
    @contents    = nil
    @status      = "Not Attacked"
    @board = board
  end

  def attack!
    @status = if contents && not_attacked?
      contents.attack!
      if contents.is_sunk?
        if (@board.left_alive.count) == 0
          "Hit. Battleship sunk. Game over"
        else
          "Hit. Battleship sunk"
        end #end of if board.left_alive
      else
        "Hit"
      end #end of if is_sunk?
    else
      "Miss"
    end # end of if hit
  end # end of method

  def occupy!(ship)
    @contents = ship
  end

  def occupied?
    !!@contents
  end

  def not_attacked?
    status == "Not Attacked"
  end
end
