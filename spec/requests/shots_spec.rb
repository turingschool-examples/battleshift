require 'rails_helper'

describe "Api::V1::Shots" do
  context "POST /api/v1/games/:id/shots" do
    let(:player_1)  { create(:user) }
    let(:player_2)  { create(:user) }
    let(:player_1_board)   { Board.new(4) }
    let(:player_2_board)   { Board.new(4) }
    let(:sm_ship) { Ship.new(2) }
    let(:game)    { Game.create!(
      player_1_id: player_1.id,
      player_2_id: player_2.id,
      player_1_board: player_1_board,
      player_2_board: player_2_board) 
    }
    
    context "when a player makes a hit" do           
      it "updates the message and board with a hit" do
        allow_any_instance_of(ApiController).to receive(:current_user).and_return(player_1)
        ShipPlacer.new(player_2_board,
                      sm_ship,
                      "A1",
                      "A2").run

        headers = { "CONTENT_TYPE" => "application/json" }
        json_payload = {target: "A1"}.to_json

        post "/api/v1/games/#{game.id}/shots", params: json_payload, headers: headers

        expect(response).to be_success

        game = JSON.parse(response.body, symbolize_names: true)

        expected_messages = "Your shot resulted in a Hit"
        player_2_targeted_space = game[:player_2_board][:rows].first[:data].first[:status]


        expect(game[:message]).to eq expected_messages
        expect(player_2_targeted_space).to eq("Hit")
      end
    end

    context "when a player misses" do
      it "updates the message and board with a miss" do
      allow_any_instance_of(ApiController).to receive(:current_user).and_return(player_1)
       
        headers = { "CONTENT_TYPE" => "application/json" }
        json_payload = {target: "A1"}.to_json

        post "/api/v1/games/#{game.id}/shots", params: json_payload, headers: headers

        expect(response).to be_success

        game = JSON.parse(response.body, symbolize_names: true)

        expected_messages = "Your shot resulted in a Miss"
        player_2_targeted_space = game[:player_2_board][:rows].first[:data].first[:status]


        expect(game[:message]).to eq expected_messages
        expect(player_2_targeted_space).to eq("Miss")
      end
    end

    it "updates the message but not the board with invalid coordinates" do
      allow_any_instance_of(ApiController).to receive(:current_user).and_return(player_1)

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
