require 'rails_helper'

RSpec.describe Ship, type: :model do
  it 'can decide where to place a ship' do
    board = Board.new(4)
    ship = Ship.new(2)

    ship.place("A1", "A2")

    starting = ship.start_space
    ending = ship.end_space

    expect(starting).to eq("A1")
    expect(ending).to eq("A2")
  end

  it 'can add to damage when ship is attacked' do
    ship = Ship.new(3)
    ship.attack!
    expect(ship.damage).to_not eq(0)
    expect(ship.damage).to eq(1)

    ship.attack!
    ship.attack!

    expect(ship.damage).to eq(3)
  end

  it 'can determine if ship is sunk' do
    ship = Ship.new(2)

    refute(ship.is_sunk?)

    ship.attack!
    ship.attack!

    assert(ship.is_sunk?)
  end
end
