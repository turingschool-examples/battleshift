require 'rails_helper'

describe 'Opponents play the game by firing at each others ships' do
  context 'POST /api/v1/games/:game_id/shots' do
    it 'controls the functionality of the gameplay' do
      player = create(:user, active: true)
      opponent = create(:user, active: true, username: 'blob', email: 'dude@dudeness.yo')

      player_board = Board.new(4)
      opponent_board = Board.new(4)

      game_attributes = {
        player_1_board: player_board,
        player_2_board: opponent_board,
        player_1_turns: 0,
        player_2_turns: 0,
        current_turn: 0,
        player_key: player.api_token,
        opponent_key: opponent.api_token
      }

      game = Game.new(game_attributes)

      player_ship = {
      ship_size: 3,
      start_space: "A1",
      end_space: "A3"
      }

      opponent_ship = {
      ship_size: 3,
      start_space: "A1",
      end_space: "C1"
      }

      ShipPlacer.new(board: player_board,
                     ship: player_ship,
                     start_space: "A1",
                     end_space: "A3"
                    ).run

      ShipPlacer.new(board: opponent_board,
                     ship: opponent_ship,
                     start_space: "A1",
                     end_space: "C1"
                    ).run

      game.save

      headers = { "CONTENT_TYPE" => "application/json" }
      headers['X-API-Key'] = player.api_token
      json_payload = {target: "D1"}.to_json

      post "/api/v1/games/#{game.id}/shots", params: json_payload, headers: headers

      updated_game = Game.find(game.id)
      binding.pry
      expect(body_json[:message]).to eq("Your shot resulted in a Miss.")
      expect(body_json[:player_2_board][:rows][3][:data][0][:status]).to eq("Miss")
    end
  end
end
