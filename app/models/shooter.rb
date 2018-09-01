class Shooter
  def initialize(board:, target:)
    @board     = board
    @target    = target
  end

  def fire!
    ship_status = {}
    if valid_shot?
      ship_status[:ship_status] = space.change_status
      ship_status[:sunk] = space.contents.is_sunk? if !space.contents.nil?
      ship_status[:game_over] = true if board.ships.all? { |ship| ship.is_sunk? }
      ship_status
    else
      raise InvalidAttack.new("Invalid coordinates.")
    end
  end

  private

  attr_reader :board, :target

  def space
    @space ||= board.locate_space(target)
  end

  def valid_shot?
    board.space_names.include?(target)
  end
end
