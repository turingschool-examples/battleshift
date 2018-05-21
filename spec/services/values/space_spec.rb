require 'rails_helper'

describe Space do
  it 'initializes' do
    space = Space.new('A1')

    expect(space).to be_instance_of(Space)
  end
  describe 'methods' do
    it '#occupy!' do
      space = Space.new('A1')
      expect(space.contents).to eq(nil)
      ship = Ship.new(2)
      space.occupy!(ship)
      expect(space.contents).to eq(ship)
    end
    it '#occupied?' do
      space = Space.new('A1')
      ship = Ship.new(2)
      expect(space.occupied?).to be_falsey
      space.occupy!(ship)
      expect(space.occupied?).to be_truthy
    end
    describe '#attack!' do
      it 'misses' do
        space = Space.new('A1')
        expect(space.attack!).to eq('Miss')
      end
      it 'hits' do
        space = Space.new('A1')
        ship = Ship.new(2)
        space.occupy!(ship)
        expect(space.attack!).to eq('Hit')
      end
      it 'hits and sinks' do
        space = Space.new('A1')
        ship = Ship.new(1)
        space.occupy!(ship)
        expect(space.attack!).to eq('Hit. Battleship sunk')
      end
    end
    it '#not_attacked?' do
      space = Space.new('A1')
      expect(space.not_attacked?).to be_truthy
      ship = Ship.new(1)
      space.occupy!(ship)
      space.attack!
      expect(space.not_attacked?).to be_falsey
    end
  end
end
