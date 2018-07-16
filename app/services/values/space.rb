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

    # REFACTOR ATTEMPT FOR ATTACK!
    # @status = if contents && not_attacked?
    #   contents.attack!
    #   case attacking
    #     when contents.is_sunk? && @board.left_alive.count == 0
    #       hit_and_sunk_end
    #     when contents.is_sunk? && @board.left_alive.count > 0
    #       hit_and_sunk
    #     when !contents.is_sunk? && @status == "Hit"
    #       hit
    #     when !contents.is_sunk && @status == "Miss"
    #       miss
    #   end
    # end


  # def miss
  #   "Miss"
  # end

  # def hit
  #   "Hit"
  # end

  # def hit_and_sunk
  #   "Hit. Battleship sunk"
  # end

  # def hit_and_sunk_end
  #   "Hit. Battleship sunk. Game over"
  # end

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
