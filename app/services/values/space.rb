class Space
  attr_reader :coordinates, :status, :contents

  def initialize(coordinates)
    @coordinates = coordinates
    @contents    = nil
    @status      = "Not Attacked"
  end

  def change_status
    @status = if contents && not_attacked?
                contents.take_damage
                "Hit"
              else
                "Miss"
              end
  end

  def occupy!(ship)
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
