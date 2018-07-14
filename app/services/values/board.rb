class Board
  attr_reader :length,
              :board

  def initialize(length)
    @length = length
    @board = create_grid
  end

  def ships
    space_names.group_by do |space_name| 
      space = locate_space(space_name)
      space.contents
    end.keys.compact
  end

  def left_to_place
    2 - ships.count
  end

  def left_alive
    ships.find_all do |ship|
         !ship.is_sunk?
    end
  end

  def length_of_remaining_ship
    if left_to_place == 1
      existing_length = ships.first.length
      if existing_length == 2
        " with a size of 3"
      else 
        " with a size of 2"
      end 
    else
      ""
    
    end
  end

  def get_row_letters
    ("A".."Z").to_a.shift(@length)
  end

  def get_column_numbers
    ("1".."26").to_a.shift(@length)
  end

  def space_names
    get_row_letters.map do |letter|
      get_column_numbers.map do |number|
        letter + number
      end
    end.flatten
  end

  def create_spaces
    space_names.map do |name|
      [name, Space.new(name, self)]
    end.to_h
  end

  def assign_spaces_to_rows
    space_names.each_slice(@length).to_a
  end

  def create_grid
    spaces = create_spaces
    assign_spaces_to_rows.map do |row|
      row.each.with_index do |coordinates, index|
        row[index] = {coordinates => spaces[coordinates]}
      end
    end
  end

  def locate_space(coordinates)
    @board.each do |row|
      row.each do |space_hash|
        return space_hash[coordinates] if space_hash.keys[0] == coordinates
      end
    end
  end
end
