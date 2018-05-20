require 'rails_helper'


describe Shooter do
  describe 'Attributes' do
    it 'has the correctly initialized attributes' do
      shooter = Shooter.new(board: Board.new(4), 'A1'))

      expect(shooter.board).to be_an_instance_of Board
    end
  end
end
