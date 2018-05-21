require 'rails_helper'

describe 'Api::V1::Shots' do
  context 'POST /api/v1/games/:id/shots' do
    let(:user1) { create(:user) }
    let(:user2) { create(:user) }
    let(:player_1_board)   { Board.new(2) }
    let(:player_2_board)   { Board.new(2) }
    let(:player_1) { Player.new(player_1_board, user1.api_key) }
    let(:player_2) { Player.new(player_2_board, user2.api_key) }
    let(:sm_ship) { Ship.new(2) }

    it 'updates the message and board with a hit' do
      game_attributes = {
                      player_1: player_1,
                      player_2: player_2,
                      player_1_board: player_1_board,
                      player_2_board: player_2_board,
                      current_turn: "player_1"
                    }
      game = Game.create(game_attributes)

      ShipPlacer.new(board: game.player_2.board,
                     ship: sm_ship,
                     start_space: 'A1',
                     end_space: 'A2').run

      ShipPlacer.new(board: game.player_1.board,
                     ship: sm_ship,
                     start_space: 'A1',
                     end_space: 'A2').run

      game.save
      headers = { 'CONTENT_TYPE' => 'application/json', 'X-API-KEY' => player_1.api_key }
      json_payload = { target: 'A1' }.to_json

      post "/api/v1/games/#{game.id}/shots", params: json_payload, headers: headers

      expect(response).to be_success

      game = JSON.parse(response.body, symbolize_names: true)

      expected_messages = "Your shot resulted in a Hit."
      player_2_targeted_space = game[:player_2_board][:rows].first[:data].first[:status]

      expect(game[:message]).to eq expected_messages
      expect(player_2_targeted_space).to eq('Hit')
    end

    it 'updates the message and board with a miss' do
      game_attributes = {
                      player_1: player_1,
                      player_2: player_2,
                      player_1_board: player_1_board,
                      player_2_board: player_2_board,
                      current_turn: "player_1"
                    }
      game = Game.create(game_attributes)

      ShipPlacer.new(board: game.player_2.board,
                     ship: sm_ship,
                     start_space: 'A1',
                     end_space: 'A2').run

      ShipPlacer.new(board: game.player_1.board,
                     ship: sm_ship,
                     start_space: 'A1',
                     end_space: 'A2').run

      game.save
      headers = { 'CONTENT_TYPE' => 'application/json', 'X-API-KEY' => player_1.api_key }
      json_payload = { target: 'B2' }.to_json

      post "/api/v1/games/#{game.id}/shots", params: json_payload, headers: headers

      expect(response).to be_success

      game = JSON.parse(response.body, symbolize_names: true)

      expected_messages = "Your shot resulted in a Miss."
      player_2_targeted_space = game[:player_2_board][:rows].last[:data].last[:status]

      expect(game[:message]).to eq expected_messages
      expect(player_2_targeted_space).to eq('Miss')
    end

    it 'updates the message but not the board with invalid coordinates' do
      game_attributes = {
                      player_1: player_1,
                      player_2: player_2,
                      player_1_board: player_1_board,
                      player_2_board: player_2_board,
                      current_turn: "player_1"
                    }
      game = Game.create(game_attributes)

      ShipPlacer.new(board: game.player_2.board,
                     ship: sm_ship,
                     start_space: 'A1',
                     end_space: 'A2').run

      ShipPlacer.new(board: game.player_1.board,
                     ship: sm_ship,
                     start_space: 'A1',
                     end_space: 'A2').run

      game.save
      headers = { 'CONTENT_TYPE' => 'application/json', 'X-API-KEY' => player_1.api_key }
      json_payload = { target: 'D5' }.to_json
      post "/api/v1/games/#{game.id}/shots", params: json_payload, headers: headers

      game = JSON.parse(response.body, symbolize_names: true)
      expect(game[:message]).to eq 'Invalid coordinates.'
    end

    it 'rejects request made by player not in the game' do
      user3 = create(:user)
      game_attributes = {
                      player_1: player_1,
                      player_2: player_2,
                      player_1_board: player_1_board,
                      player_2_board: player_2_board,
                      current_turn: "player_1"
                    }
      game = Game.create(game_attributes)

      ShipPlacer.new(board: game.player_2.board,
                     ship: sm_ship,
                     start_space: 'A1',
                     end_space: 'A2').run

      ShipPlacer.new(board: game.player_1.board,
                     ship: sm_ship,
                     start_space: 'A1',
                     end_space: 'A2').run

      game.save
      headers = { 'CONTENT_TYPE' => 'application/json', 'X-API-KEY' => user3.api_key }
      json_payload = { target: 'A1' }.to_json
      post "/api/v1/games/#{game.id}/shots", params: json_payload, headers: headers

      game = JSON.parse(response.body, symbolize_names: true)
      expect(game[:message]).to eq 'Unauthorized'
    end
  end
end
