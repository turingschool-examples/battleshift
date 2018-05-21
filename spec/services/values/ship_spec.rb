require 'rails_helper'

describe Ship do
  scenario 'initializes properly' do
    ship = Ship.new(3)

    expect(ship.length).to eq(3)
    expect(ship.damage).to eq(0)
  end

  describe 'methods' do
    it '#attack!' do
      ship = Ship.new(3)

      ship.attack!

      expect(ship.damage).to eq(1)
    end
    it '#is_sunk?' do
      ship = Ship.new(3)

      ship.attack!
      ship.attack!

      expect(ship.is_sunk?).to eq(false)

      ship.attack!

      expect(ship.is_sunk?).to eq(true)
    end
  end
end
