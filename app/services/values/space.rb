class Space
  attr_reader :coordinates, :status, :contents

  def initialize(coordinates)
    @coordinates = coordinates
    @contents    = nil
    @status      = "Not Attacked"
  end

  def change_status
    # TODO: ship also has a .attack! method which determines damage, may want to rename attack! on ship class to avoid confusion
    @status = if contents && not_attacked?
                contents.take_damage
                "Hit"
              else
                "Miss"
              end
  end

  def occupy!(ship)
    # TODO this could probably be done at initialize
    @contents = ship
  end

  def occupied?
    #TODO Why are there two bangs?
    !!@contents
  end

  def not_attacked?
    status == "Not Attacked"
  end
end
