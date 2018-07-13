require 'rails_helper'

describe "Api::V1::Shots" do
  context "POST /api/v1/games/:id/shots" do
    let(:user1) {create(:user)}
    let(:user2) {create(:user2)}
    let(:player_1_board)   { Board.new(4) }
    let(:player_2_board)   { Board.new(4) }
    let(:sm_ship) { Ship.new(2) }
    let(:game)    {
        Game.create(player_1: user1, player_2: user2, player_1_board: player_1_board, player_2_board: player_2_board, current_turn: "player 1", player_1_turns: 0, player_2_turns: 0)
    }

    it 'can fire shots' do
      ShipPlacer.new(board: player_2_board,
        ship: sm_ship,
        start_space: "A1",
        end_space: "A2").run

      ShipPlacer.new(board: player_1_board,
        ship: sm_ship,
        start_space: "B1",
        end_space: "B2").run

        post "/api/v1/games/#{game.id}/shots?target=A1", headers: { 'X-API-Key': user1.api_key, 'CONTENT_TYPE': 'application/json'}

        expect(response).to be_success

        body = JSON.parse(response.body, symbolize_names: true)
       
        expected_messages = "Your shot resulted in a Hit."
        expect(body[:message]).to eq expected_messages

        # Firing on opponents turn
        post "/api/v1/games/#{game.id}/shots?target=A2", headers: { 'X-API-Key': user1.api_key, 'CONTENT_TYPE': 'application/json'}

        expect(response).to_not be_success
        body = JSON.parse(response.body, symbolize_names: true)

        expected_messages = "Invalid move. It's your opponent's turn"
        expect(body[:message]).to eq expected_messages

        # Player 2 misses
        post "/api/v1/games/#{game.id}/shots?target=A2", headers: { 'X-API-Key': user2.api_key, 'CONTENT_TYPE': 'application/json'}

        expect(response).to be_success
        body = JSON.parse(response.body, symbolize_names: true)

        expected_messages = "Your shot resulted in a Miss."
        expect(body[:message]).to eq expected_messages

        # Other player fires
        user3 = User.create(email: 'pop@pop.pop', name: 'pop', password: '1234', api_key: '2468')

        post "/api/v1/games/#{game.id}/shots?target=A2", headers: { 'X-API-Key': user3.api_key, 'CONTENT_TYPE': 'application/json'}

        expect(response).to_not be_success
      # Player 1 fires at invalid coordinates
      post "/api/v1/games/#{game.id}/shots?target=F7", headers: { 'X-API-Key': user1.api_key, 'CONTENT_TYPE': 'application/json'}

        expect(response).to_not be_success
        body = JSON.parse(response.body, symbolize_names: true)

        expected_messages = "Invalid coordinates."
        expect(body[:message]).to eq expected_messages
        #Player 1 sinks a ship
      end


    xit "updates the message and board with a hit" do
      allow_any_instance_of(AiSpaceSelector).to receive(:fire!).and_return("Miss")
      ShipPlacer.new(board: player_2_board,
                     ship: sm_ship,
                     start_space: "A1",
                     end_space: "A2").run

      headers = { "CONTENT_TYPE" => "application/json" }
      json_payload = {target: "A1"}.to_json

      post "/api/v1/games/#{game.id}/shots", params: json_payload, headers: headers

      expect(response).to be_success

      game = JSON.parse(response.body, symbolize_names: true)

      expected_messages = "Your shot resulted in a Hit. The computer's shot resulted in a Miss."
      player_2_targeted_space = game[:player_2_board][:rows].first[:data].first[:status]


      expect(game[:message]).to eq expected_messages
      expect(player_2_targeted_space).to eq("Hit")
    end

    xit "updates the message and board with a miss" do
      allow_any_instance_of(AiSpaceSelector).to receive(:fire!).and_return("Miss")

      headers = { "CONTENT_TYPE" => "application/json" }
      json_payload = {target: "A1"}.to_json

      post "/api/v1/games/#{game.id}/shots", params: json_payload, headers: headers

      expect(response).to be_success

      game = JSON.parse(response.body, symbolize_names: true)

      expected_messages = "Your shot resulted in a Miss. The computer's shot resulted in a Miss."
      player_2_targeted_space = game[:player_2_board][:rows].first[:data].first[:status]


      expect(game[:message]).to eq expected_messages
      expect(player_2_targeted_space).to eq("Miss")
    end

    xit "updates the message but not the board with invalid coordinates" do
      player_1_board = Board.new(1)
      player_2_board = Board.new(1)
      game = create(:game, player_1_board: player_1_board, player_2_board: player_2_board)

      headers = { "CONTENT_TYPE" => "application/json" }
      json_payload = {target: "B1"}.to_json
      post "/api/v1/games/#{game.id}/shots", params: json_payload, headers: headers

      game = JSON.parse(response.body, symbolize_names: true)
      expect(game[:message]).to eq "Invalid coordinates."
    end

  end
end
