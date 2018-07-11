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
end