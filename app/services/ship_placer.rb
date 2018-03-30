class ShipPlacer
  attr_reader :messages
  def initialize(board:, ship:, start_space:, end_space:)
    @board       = board
    @ship        = ship
    @start_space = start_space
    @end_space   = end_space
    @message_1 = ""
    @message_2 = ""
    @spaces_left_to_place = 5
    @ships_left_to_place = 2
  end

  def messages
    @message_1 + @message_2
  end

  def run
    if same_row?
      place_in_row
    elsif same_column?
      place_in_column
    else
      raise InvalidShipPlacement.new("Ship must be in either the same row or column.")
    end
  end

  private
  attr_reader :board, :ship,
    :start_space, :end_space

  def same_row?
    start_space[0] == end_space[0]
  end

  def same_column?
    start_space[1] == end_space[1]
  end

  def place_in_row
    row = start_space[0]
    range = start_space[1]..end_space[1]
    msg = "Ship size must be equal to the number of spaces you are trying to fill."
    raise InvalidShipPlacement unless range.count == ship.length.to_i
    range.each { |column| place_ship(row, column) }
    @ships_left_to_place -= 1
    @message_1 = "Successfully placed ship with a size of #{ship.length}. "
    @message_2 = "You have #{@ships_left_to_place} ship(s) to place with a size of #{@spaces_left_to_place}."
  end

  def place_in_column
    column = start_space[1]
    range   = start_space[0]..end_space[0]
    raise InvalidShipPlacement unless range.count == ship.length.to_i
    range.each { |row| place_ship(row, column) }
    @ships_left_to_place -= 1
    @message_1 = "Successfully placed ship with a size of #{ship.length}. "
    @message_2 = "You have #{@ships_left_to_place} ship(s) to place with a size of #{@spaces_left_to_place}."
  end

  def place_ship(row, column)
    coordinates = "#{row}#{column}"
    space = board.locate_space(coordinates)
    if space.occupied?
      raise InvalidShipPlacement.new("Attempting to place ship in a space that is already occupied.")
    else
      space.occupy!(ship)
      @spaces_left_to_place -= 1
    end
  end
end

class InvalidShipPlacement < StandardError
  def initialize(msg = "Invalid ship placement")
    super
  end
end
