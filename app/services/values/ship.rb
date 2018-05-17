class Ship
  attr_reader :length, :damage, :start_space,
              :end_space

  def initialize(length)
    @start_space = nil 
    @end_space = nil
    @length = length
    @damage = 0
  end

  def place(start_space, end_space)
    @start_space = start_space
    @end_space = end_space
  end

  def place(start_space, end_space)
    @start_space = start_space
    @end_space = end_space
  end

  def attack!
    @damage += 1
  end

  def is_sunk?
    # not used
    @damage == @length
  end
end
