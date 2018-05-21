class Ship
  attr_reader :length, :damage, :start_space,
              :end_space

  def initialize(length)
    @length = length
    @damage = 0
  end

  def attack!
    @damage += 1
  end

  def is_sunk?
    @damage == @length
  end
end
