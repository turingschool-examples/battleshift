require 'rails_helper'


describe Shooter do
  describe 'Instance fire method' do
    it 'results in a miss' do
      shooter = Shooter.new(board: Board.new(4), target: 'A1')
      result = shooter.fire!

      expect(shooter).to be_a Shooter
      expect(result).to eq('Miss')
    end

    it 'results in a hit' do
      board = Board.new(4)
      ship = Ship.new(2)
      ShipPlacer.new(board: board,
                     ship: ship,
                     start_space: 'A1',
                     end_space: 'A2').run
      shooter = Shooter.new(board: board, target: 'A1')

      result = shooter.fire!

      expect(shooter). to be_a Shooter
      expect(result).to eq('Hit')
    end

    it 'results in a raise error' do
      board = Board.new(4)
      ship = Ship.new(2)
      ShipPlacer.new(board: board,
                     ship: ship,
                     start_space: 'A1',
                     end_space: 'A2').run
      shooter = Shooter.new(board: board, target: 'E1')
      expect { raise shooter.fire! }.to raise_error(InvalidAttack)
    end
  end

  describe 'Class method fire' do
    it 'results in a miss' do
      expect(Shooter.new(board: Board.new(4), target: 'A1').fire!).to eq('Miss')
    end

    it 'results in a hit' do
      board = Board.new(4)
      ship = Ship.new(2)
      ShipPlacer.new(board: board,
                     ship: ship,
                     start_space: 'A1',
                     end_space: 'A2').run
      expect(Shooter.new(board: board, target: 'A1').fire!).to eq('Hit')
    end

    it 'results in a hit' do
      board = Board.new(4)
      ship = Ship.new(2)
      ShipPlacer.new(board: board,
                     ship: ship,
                     start_space: 'A1',
                     end_space: 'A2').run
      expect { raise Shooter.new(board: board, target: 'E1').fire! }.to raise_error(InvalidAttack)
    end
  end
end
