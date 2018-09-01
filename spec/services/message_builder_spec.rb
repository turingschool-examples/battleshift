require 'rails_helper'

describe '' do
  let(:game) { Game.new }
  let(:board) { Board.new(4) }
  let(:ship)  {  length: 2 }
  let(:ship_placer) { ShipPlacer.new(board: board, ship: ship, start_space: "A1", end_space: "A2") }
end
