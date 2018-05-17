class Space
  attr_reader :coordinates, :contents
  attr_accessor :status

  def initialize(coordinates)
    @coordinates = coordinates
    @contents    = nil
    @status      = "Not Attacked"
  end

  def attack!
    @status = if contents && not_attacked?
                contents.attack!
                "Hit"
              else
                "Miss"
              end
  end

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
