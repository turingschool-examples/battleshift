class Shooter
  #TODO board and target probably don't need to be passed in as symbols?
  #TODO edge case test an incorrect target
  def initialize(board:, target:)
    @board     = board
    @target    = target
    @message   = ""
  end

  def fire!
    if valid_shot?
      space.attack!
    else
      #TODO test as edge case if this untested
      raise InvalidAttack.new("Invalid coordinates.")
    end
  end

  def self.fire!(board:, target:)
    #TODO this is a class method calling the assigned instance method. Polymorphic to the MAX. There are four methods called fire!
    new(board: board, target: target).fire!
  end

  private
    # TODO: strange set up with the attr_readers here mimicing the attr readers for the class.
    attr_reader :board, :target

    def space
      # returns space object
      @space ||= board.locate_space(target)
    end

    def valid_shot?
      # validates shot against array of ["A1", "B2"], etc.
      board.space_names.include?(target)
    end
end

class InvalidAttack < StandardError
  #TODO maybe move this somewhere else. This raises an error and takes an argument so it's definitely useful. StandardError comes with Ruby.
  def initialize(msg = "Invalid attack.")
    super(msg)
  end
end
