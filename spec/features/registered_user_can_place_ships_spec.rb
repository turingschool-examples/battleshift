require 'rails_helper'

describe 'Registered user' do
  let(:user1) { create(:user) }
  let(:user2) { create(:user) }
  let(:game) { create(:game, player_1_id: user1, player_2_id: user2)}
  let(:board1) { create(:board, user: user1, game: game) }
  let(:board2) { create(:board, user: user2, game: game) }
  let(:player_1_ship_1) { create(:ship, length: 2)}
  let(:player_1_ship_2) { create(:ship, length: 3)}
  context 'after starting a game with another registered user' do
    it 'the user can send a request to the ship placing endpoint and place a ship' do
      create_spaces(board1)
      create_spaces(board2)    
      post "/api/v1/games/#{game.id}/ships", params: { ship_size: player_1_ship_1.length, start_space: "B1", end_space: "C1" }

      expect(board1.spaces.find_by(name: "B1").ship_id).to eq(player_1_ship_1.id)
    end
  end
end

  