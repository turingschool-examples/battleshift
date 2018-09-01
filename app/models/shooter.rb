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
      binding.pry
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
