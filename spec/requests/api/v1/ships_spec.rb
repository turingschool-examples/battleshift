require 'rails_helper'

describe 'player and opponent can place ships on the board' do
  context 'POST /api/v1/games/#{game_id}/ships' do
    it 'can place ship with a valid api_key' do
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

      updated_game = Game.find(game.id)

      expect(updated_game.player_1_board.board.first.first['A1'].contents).to be_a(Ship)
      expect(updated_game.player_1_board.board.first[1]['A2'].contents).to be_a(Ship)
      expect(updated_game.player_1_board.board.first[2]['A3'].contents).to be_a(Ship)
    end
    it 'will not place ship with an invalid api_key' do
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
      headers['X-API-Key'] = "pOIUiuIIO890ihLKob"
      ship_1_payload = {
                        ship_size: 3,
                        start_space: "A1",
                        end_space: "A3"
                       }.to_json

      post "/api/v1/games/#{game.id}/ships", params: ship_1_payload, headers: headers

      updated_game = Game.find(game.id)

      expect(response.status).to eq(401)
    end
  end
end
