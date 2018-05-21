require 'rails_helper'

RSpec.describe Game, type: :model do
  describe 'relationships' do
    it { should validate_presence_of(:player_1) }
    it { should validate_presence_of(:player_2) }
  end
  describe 'methods' do
    it '#game_over' do
      game = Game.new
      expect(game.game_over?).to be_falsey

      game.winner = 'user@email.com'

      expect(game.game_over?).to be_truthy
    end
  end
end
