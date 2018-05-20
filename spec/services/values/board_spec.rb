require 'rails_helper'
require './app/services/values/space.rb'

describe Board do
  scenario 'initialize' do
    board = Board.new(4)

    expect(board).to be_instance_of(Board)
  end
  scenario 'spaces' do
    board = Board.new(4)

    expect(board.board.flatten[0].values[0].class).to be_instance_of(Space)
    expect(board.board.flatten[0].values[0].coordinates).to eq('A1')
    expect(board.board.flatten[0].values[15].coordinates).to eq('D4')
  end
end
