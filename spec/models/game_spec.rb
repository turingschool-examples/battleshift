require 'rails_helper'

RSpec.describe Game, type: :model do
  context 'validations' do
    it { should validate_presence_of(:player_1_id) }
    it { should validate_presence_of(:player_2_id) }
  end

  context 'instance methods' do
    it '#turn_switcher' do
      game = create(:game)
      
      player_1 = game.player_1

      expect(game.current_turn).to eq("player 1")

      game.turn_switcher(player_1)

      expect(game.current_turn).to eq("player 2")
    end
  end

  # context 'relationships' do
  #   it { should belong_to(:user) }
  # end
end
