require 'rails_helper'

RSpec.describe Game, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:player_1_board) }
    it { is_expected.to validate_presence_of(:player_2_board) }
  end

  describe 'class methods' do
    describe '.create_default' do
      let(:game) { Game.create_default }

      it 'creates a game with a 4x4 board' do
        size1 = game.player_1_board.board.size
        size2 = game.player_2_board.board.size

        expect(game.player_1_board).to be_a(Board)
        expect(game.player_2_board).to be_a(Board)
        expect(size1).to eq(4)
        expect(size2).to eq(4)
      end
    end
  end
end
