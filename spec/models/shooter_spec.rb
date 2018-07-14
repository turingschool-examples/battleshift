require 'rails_helper'

RSpec.describe Shooter, type: :model do
  it 'can fire' do
    coordinates = "A1"
    board = Board.new(4)
    # binding.pry
    # allow_any_instance_of(Board).to receive(:space_names).and_return("Hit")
    space = board.locate_space(coordinates)

    shooter = Shooter.new(board: board, target: "A1")

    # binding.pry
    shooter.fire!

    expect(space.status).to eq("Miss")
  end
end