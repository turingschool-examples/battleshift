require 'rails_helper'

RSpec.describe Board, type: :model do
  it 'returns array of ships' do
    player_1_board = Board.new(4)
    sm_ship = Ship.new(2)
    md_ship = Ship.new(3)

    ShipPlacer.new(board: player_1_board,
                   ship: sm_ship,
                   start_space: "A1",
                   end_space: "A2"
                  ).run

    ShipPlacer.new(board: player_1_board,
                   ship: md_ship,
                   start_space: "B1",
                   end_space: "D1"
                  ).run

    ships = player_1_board.ships
    expect(ships).to eq([sm_ship, md_ship])
  end

  it 'returns how many ships are available for placement on board' do
    board = Board.new(4)
    sm_ship = Ship.new(2)
    md_ship = Ship.new(3)

    expect(board.left_to_place).to eq(2)

    ShipPlacer.new(board: board,
                   ship: sm_ship,
                   start_space: "A1",
                   end_space: "A2"
                  ).run

    expect(board.left_to_place).to eq(1)

    ShipPlacer.new(board: board,
    ship: md_ship,
    start_space: "B1",
    end_space: "D1"
   ).run

    expect(board.left_to_place).to eq(0)
  end

  it 'returns the length of remaining ship' do
    board = Board.new(4)
    sm_ship = Ship.new(2)
    md_ship = Ship.new(3)


    ShipPlacer.new(board: board,
                   ship: sm_ship,
                   start_space: "A1",
                   end_space: "A2"
                  ).run

    expect(board.length_of_remaining_ship).to eq(" with a size of 3")

    ShipPlacer.new(board: board,
    ship: md_ship,
    start_space: "B1",
    end_space: "D1"
   ).run

    expect(board.length_of_remaining_ship).to eq('')
  end
end
