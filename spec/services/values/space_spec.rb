require 'rails_helper'

RSpec.describe Space, type: :model do

  it 'returns a status' do
    coordinates = double("Coordinates", :coordinate => "A1")
    board = double("Board", :length => 4)
    space = Space.new(coordinates, board)

    expect(space.status).to eq("Not Attacked")
  end

  it 'attack' do
    coordinates = double("Coordinates", :coordinate => "A1")
    board = double("Board", :length => 4)
    space = Space.new(coordinates, board)

    space.attack!

    expect(space.status).to eq("Miss")
  end

  it 'can make a space occupied' do
    coordinates = "A1"
    board = Board.new(4)
    sm_ship = Ship.new(2)
    space = Space.new(coordinates, board)

    space.occupy!(sm_ship)

    result = space.occupied?

    expect(result).to eq(true)
  end

  it 'can tell if space is occupied' do
    coordinates = "A1"
    board = Board.new(4)
    sm_ship = Ship.new(2)
    space = Space.new(coordinates, board)

    placed_ship = ShipPlacer.new(
        board: board,
        ship: sm_ship,
        start_space: "A1",
        end_space: "A2").run

    result = board.board.first.first["A1"].occupied?

    expect(result).to eq(true)
  end
end
