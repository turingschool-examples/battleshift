require 'rails_helper'
# require './app/models/player'
# require './app/services/values/board'

describe Player do
  describe 'it initializes with right attribures' do
    it 'has valid attributes' do
      player = Player.new(Board.new(3), 'ryN_smRulKiEf33z6LoO-w')

      expect(player.board).to be_a Board
      expect(player.api_key).to eq('ryN_smRulKiEf33z6LoO-w')
      expect(player.turns).to eq(0)
    end
  end
end
