require 'rails_helper'
require './app/services/values/space.rb'

describe Board do
  before :all do
    @board = Board.new(4)
    @length = @board.length
  end
  describe 'initialize' do
    it 'is a board' do
      expect(@board).to be_instance_of(Board)
    end
    it 'has rows' do
      expect(@board.board.flatten[0].keys[0][0]).to eq('A')
      expect(@board.board.flatten[4].keys[0][0]).to eq('B')
      expect(@board.board.flatten[8].keys[0][0]).to eq('C')
      expect(@board.board.flatten[12].keys[0][0]).to eq('D')
    end
    it 'has columns' do
      expect(@board.board.flatten[0].keys[0][1]).to eq('1')
      expect(@board.board.flatten[1].keys[0][1]).to eq('2')
      expect(@board.board.flatten[2].keys[0][1]).to eq('3')
      expect(@board.board.flatten[3].keys[0][1]).to eq('4')
    end
    it 'has spaces' do
      expect(@board.board.flatten[0].values[0]).to be_instance_of(Space)
      expect(@board.board.flatten[0].values[0].coordinates).to eq('A1')
      expect(@board.board.flatten[15].values[0].coordinates).to eq('D4')
    end
  end
  describe 'methods' do
    it '#get_row_letters' do
      row_letters = @board.get_row_letters
      expect(row_letters).to eq(['A', 'B', 'C', 'D'])
    end
    it '#get_column_numbers' do
      column_numbers = @board.get_column_numbers
      expect(column_numbers).to eq(['1', '2', '3', '4'])
    end
    it '#space_names' do
      space_names = @board.space_names
      expectation = ['A1', 'A2', 'A3', 'A4',
                     'B1', 'B2', 'B3', 'B4',
                     'C1', 'C2', 'C3', 'C4',
                     'D1', 'D2', 'D3', 'D4']
      expect(space_names).to eq(expectation)
    end
    it '#create_spaces' do
      created_spaces = @board.create_spaces
      expectation = ['A1', 'A2', 'A3', 'A4',
                     'B1', 'B2', 'B3', 'B4',
                     'C1', 'C2', 'C3', 'C4',
                     'D1', 'D2', 'D3', 'D4']
      expect(created_spaces.keys).to eq(expectation)
      expect(created_spaces.values[0]).to be_instance_of(Space)
    end
    it '#assign_spaces_to_rows' do
      spaces_to_rows = @board.assign_spaces_to_rows
      expect(spaces_to_rows[0]).to eq(['A1', 'A2', 'A3', 'A4'])
    end
    it '#create_grid' do
      grid = @board.create_grid
      num_rows = grid.length
      num_columns = grid[0].length
      expect(num_rows).to eq(4)
      expect(num_columns).to eq(4)
    end
    it '#locate_space' do
      first_space = @board.locate_space('A1')
      expect(first_space).to eq(@board.board.flatten[0].values[0])
    end
  end
end
