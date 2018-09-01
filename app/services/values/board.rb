class Board
  attr_reader :length,
              :board

  def initialize(length)
    @length = length
    @board = create_grid
  end

  def get_row_letters
    ("A".."Z").to_a.shift(@length)
  end

  def get_column_numbers
    ("1".."26").to_a.shift(@length)
  end

  def space_names
    # TODO remove nested enumerable for more performant code.
    get_row_letters.map do |letter|
      get_column_numbers.map do |number|
        letter + number
      end
    end.flatten
  end

  def create_spaces
    space_names.map do |name|
      [name, Space.new(name)]
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

  def get_spaces_between(coordinate1, coordinate2)
    return get_row_spaces_between(coordinate1, coordinate2) if same_row?(coordinate1, coordinate2)
    return get_column_spaces_between(coordinate1, coordinate2) if same_column?(coordinate1, coordinate2)
  end

  def get_column_spaces_between(coordinate1, coordinate2)
    rows = (get_smaller_row(coordinate1, coordinate2)..get_bigger_row(coordinate1, coordinate2)).to_a
    rows.map { |row| row + get_column(coordinate1) }
  end

  def get_bigger_column(coordinate1, coordinate2)
    get_column(coordinate1).to_i > get_column(coordinate2).to_i ? get_column(coordinate1) : get_column(coordinate2)
  end

  def get_smaller_column(coordinate1, coordinate2)
    get_column(coordinate1).to_i < get_column(coordinate2).to_i ? get_column(coordinate1) : get_column(coordinate2)
  end

  def get_bigger_row(coordinate1, coordinate2)
    get_row(coordinate1) > get_row(coordinate2) ? get_row(coordinate1) : get_row(coordinate2)
  end

  def get_smaller_row(coordinate1, coordinate2)
    get_row(coordinate1) < get_row(coordinate2) ? get_row(coordinate1) : get_row(coordinate2)
  end

  def get_row(coordinate)
    coordinate.split("")[0]
  end

  def get_column(coordinate)
    coordinate[1..-1]
  end

  def get_horizontal_length(coordinate1, coordinate2)
    return false if !same_row?(coordinate1, coordinate2)
    column1 = get_column(coordinate1).to_i
    column2 = get_column(coordinate2).to_i
    column1 > column2 ? (column1 - column2) + 1 : (column2 - column1) + 1
  end

  def get_vertical_length(coordinate1, coordinate2)
    return false if !same_column?(coordinate1, coordinate2)
    row1 = get_row_letters.index(get_row(coordinate1))
    row2 = get_row_letters.index(get_row(coordinate2))
    row1 > row2 ? (row1 - row2) + 1 : (row2 - row1) + 1
  end

  def set_space_occupied(coordinate)
    get_space(coordinate).occupied = true
  end

  def set_column_spaces_occupied(coordinate1, coordinate2)
    get_column_spaces_between(coordinate1, coordinate2).each do |coordinate|
      set_space_occupied(coordinate)
    end
  end

  def set_space_attacked(coordinate)
    get_space(coordinate).attacked = true
  end
end
