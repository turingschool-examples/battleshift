require 'rails_helper'

describe Player do
  context 'attributes' do
    subject { Player.new(Board.new) }

    it 'has a board' do
      expect(subject.board.class).to eq(Board)
    end
  end
end
