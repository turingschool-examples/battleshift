require 'rails_helper'

describe "Api::V1::Shots" do
  context "POST /api/v1/games/:id/shots" do
    let(:user1) {create(:user)}
    let(:user2) {create(:user2)}
    let(:player_1_board)   { Board.new(4) }
    let(:player_2_board)   { Board.new(4) }
    let(:sm_ship) { Ship.new(2) }
    let(:md_ship) { Ship.new(3) }
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

      # fires before ships are placed
      post "/api/v1/games/#{game.id}/shots?target=A1", headers: { 'X-API-Key': user1.api_key, 'CONTENT_TYPE': 'application/json'}
      expect(response).to_not be_success

      body = JSON.parse(response.body, symbolize_names: true)

      expected_messages = "You must place all ships first."
      expect(body[:message]).to eq expected_messages

      game.reload
      player_1_board = game.player_1_board
      player_2_board = game.player_2_board

      ShipPlacer.new(board: player_2_board,
        ship: md_ship,
        start_space: "C1",
        end_space: "C3").run

      ShipPlacer.new(board: player_1_board,
        ship: md_ship,
        start_space: "C1",
        end_space: "C3").run

        game.save

        # player one fires a hit
        post "/api/v1/games/#{game.id}/shots?target=A1", headers: { 'X-API-Key': user1.api_key, 'CONTENT_TYPE': 'application/json'}

        body = JSON.parse(response.body, symbolize_names: true)
        expect(response).to be_success

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

        # User not involved in game fires
        user3 = User.create(email: 'pop@pop.pop', name: 'pop', password: '1234', api_key: '2468')

        post "/api/v1/games/#{game.id}/shots?target=A2", headers: { 'X-API-Key': user3.api_key, 'CONTENT_TYPE': 'application/json'}

        expect(response).to_not be_success

        # Player 1 fires at invalid coordinates
        post "/api/v1/games/#{game.id}/shots?target=F7", headers: { 'X-API-Key': user1.api_key, 'CONTENT_TYPE': 'application/json'}
        body = JSON.parse(response.body, symbolize_names: true)

        expect(response).to_not be_success
        expected_messages = "Invalid coordinates."
        expect(body[:message]).to eq expected_messages

        #Player 1 sinks a ship
        post "/api/v1/games/#{game.id}/shots?target=A2", headers: { 'X-API-Key': user1.api_key, 'CONTENT_TYPE': 'application/json'}

        body = JSON.parse(response.body, symbolize_names: true)
        expect(response).to be_success

        expected_messages = "Your shot resulted in a Hit. Battleship sunk."
        expect(body[:message]).to eq expected_messages

        #Player 2 fires a hit
        post "/api/v1/games/#{game.id}/shots?target=B1", headers: { 'X-API-Key': user2.api_key, 'CONTENT_TYPE': 'application/json'}

        body = JSON.parse(response.body, symbolize_names: true)
        expect(response).to be_success

        expected_messages = "Your shot resulted in a Hit."
        expect(body[:message]).to eq expected_messages

        #Player 1 fires a hit
        post "/api/v1/games/#{game.id}/shots?target=C1", headers: { 'X-API-Key': user1.api_key, 'CONTENT_TYPE': 'application/json'}
        #Player 2 fires a hit
        post "/api/v1/games/#{game.id}/shots?target=C1", headers: { 'X-API-Key': user2.api_key, 'CONTENT_TYPE': 'application/json'}
        #Player 1 fires a hit
        post "/api/v1/games/#{game.id}/shots?target=C2", headers: { 'X-API-Key': user1.api_key, 'CONTENT_TYPE': 'application/json'}
        #Player 2 fires a hit
        post "/api/v1/games/#{game.id}/shots?target=C2", headers: { 'X-API-Key': user2.api_key, 'CONTENT_TYPE': 'application/json'}

        #Player 1 wins the game
        post "/api/v1/games/#{game.id}/shots?target=C3", headers: { 'X-API-Key': user1.api_key, 'CONTENT_TYPE': 'application/json'}

        body = JSON.parse(response.body, symbolize_names: true)
        expect(response).to be_success

        expected_messages = "Your shot resulted in a Hit. Battleship sunk. Game over."
        expect(body[:message]).to eq expected_messages

        #Player 2 can't fire because the game is over
        post "/api/v1/games/#{game.id}/shots?target=C3", headers: { 'X-API-Key': user2.api_key, 'CONTENT_TYPE': 'application/json'}

        body = JSON.parse(response.body, symbolize_names: true)
        expect(response).to_not be_success

        expected_messages = "Invalid move. Game over."
        expect(body[:message]).to eq expected_messages
      end
    end
  end
