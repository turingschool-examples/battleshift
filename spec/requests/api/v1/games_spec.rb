require 'rails_helper'

describe 'User starts new game with opponent email' do
  context 'POST /api/v1/games' do
    it 'creates a new game with player 1 api_key and opponent email 1' do
      user_1 = create(:user, active: true)
      user_2 = create(:user, active: true, username: 'blob', email: 'dude@dudeness.yo')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_1)

      headers = { "CONTENT_TYPE" => "application/json" }
      headers['X-API-Key'] = user_1.api_token
      json_payload = {opponent_email: user_2.email}.to_json

      expect(Game.count).to eq(0)

      post "/api/v1/games", params: json_payload, headers: headers

      expect(Game.count).to eq(1)
    end
  end
  context 'POST /api/v1/games/#{game_id}/ships' do
    it 'creates a new game with player 1 api_key and opponent email 1' do
      user_1 = create(:user, active: true)
      user_2 = create(:user, active: true, username: 'blob', email: 'dude@dudeness.yo')

      game_attributes = {
        player_1_board: Board.new(4),
        player_2_board: Board.new(4),
        player_1_turns: 0,
        player_2_turns: 0,
        player_key: user_1.api_token,
        opponent_key: user_2.api_token
      }

      game = Game.create(game_attributes)

      ship_1_payload = {
      ship_size: 3,
      start_space: "A1",
      end_space: "A3"
      }

      headers = { "CONTENT_TYPE" => "application/json" }
      headers['X-API-Key'] = user_1.api_token
      ship_1_payload = {
                        ship_size: 3,
                        start_space: "A1",
                        end_space: "A3"
                       }.to_json

      post "/api/v1/games/#{game.id}/ships", params: ship_1_payload, headers: headers
    end
  end
end
