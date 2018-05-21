require 'rails_helper'

describe Player do
  describe 'it initializes with right attribures' do
    it 'has valid attributes' do
      board = double('board')
      player = Player.new(board, 'ryN_smRulKiEf33z6LoO-w')

      expect(player.board).to_not be(nil)
      expect(player.api_key).to eq('ryN_smRulKiEf33z6LoO-w')
    end
  end
end
