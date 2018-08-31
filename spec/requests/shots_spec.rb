require 'rails_helper'

describe "Api::V1::Shots" do
  context "POST /api/v1/games/:id/shots" do
    before :each do
      @user_1 = create(:user)
      @user_2 = create(:user, auth_token: "kasvkb495489", email: "fakeymcfake@fake.com")

      p1_board = Board.new(4)
      p2_board = Board.new(4)

      sm_ship = Ship.new(2)
      md_ship = Ship.new(3)

      sm2_ship = Ship.new(2)
      md2_ship = Ship.new(3)

      ShipPlacer.new(
                      board: p1_board,
                      ship: sm_ship,
                      start_space: "A1",
                      end_space: "A2"
                    ).run

      ShipPlacer.new(
                      board: p1_board,
                      ship: md_ship,
                      start_space: "B1",
                      end_space: "D1"
                    ).run

      ShipPlacer.new(
                      board: p2_board,
                      ship: sm2_ship,
                      start_space: "A1",
                      end_space: "A2"
                    ).run

      ShipPlacer.new(
                      board: p2_board,
                      ship: md2_ship,
                      start_space: "B1",
                      end_space: "D1"
                    ).run

      @game = Game.create!(
                        player_1_board: p1_board,
                        player_2_board: p2_board,
                        winner: nil,
                        player_1_turns: 0,
                        player_2_turns: 0,
                        player_1_auth_token: @user_1.auth_token,
                        player_2_auth_token: @user_2.auth_token,
                        current_turn: "player_1"
                      )

    end

    it "player_1 can fire a shot" do
      headers = { "CONTENT_TYPE" => "application/json", "X-API-KEY" => "#{@user_1.auth_token}" }

      targeted_space = "A1"

      json_payload = {target: targeted_space}.to_json

      post "/api/v1/games/#{@game.id}/shots", params: json_payload, headers: headers

      payload = JSON.parse(response.body, symbolize_names: true)

      @game.reload

      expect(@game.player_2_board.board.first.first[targeted_space].status).to eq("Hit")
      expect(response).to be_success
      expect(payload[:message]).to eq("Your shot resulted in a Hit.")
    end

    it "player 1 can not fire 2 shots in a row" do
      headers = { "CONTENT_TYPE" => "application/json", "X-API-KEY" => "#{@user_1.auth_token}" }

      json_payload = {target: "A1"}.to_json

      post "/api/v1/games/#{@game.id}/shots", params: json_payload, headers: headers

      targeted_space = "A2"

      json_payload = {target: targeted_space}.to_json

      post "/api/v1/games/#{@game.id}/shots", params: json_payload, headers: headers

      payload = JSON.parse(response.body, symbolize_names: true)

      expect(expect(@game.player_2_board.board.first.second[targeted_space].status).to eq("Not Attacked"))
      expect(payload[:message]).to eq("Invalid move. It's your opponent's turn")
    end
  end
end

# let(:player_1_board)   { Board.new(4) }
# let(:player_2_board)   { Board.new(4) }
# let(:sm_ship) { Ship.new(2) }
# let(:game)    {
#   create(:game,
#     player_1_board: player_1_board,
#     player_2_board: player_2_board
#   )
# }
#
# it "updates the message and board with a hit" do
#   allow_any_instance_of(AiSpaceSelector).to receive(:fire!).and_return("Miss")
#   ShipPlacer.new(board: player_2_board,
#                  ship: sm_ship,
#                  start_space: "A1",
#                  end_space: "A2").run
#
#   headers = { "CONTENT_TYPE" => "application/json" }
#   json_payload = {target: "A1"}.to_json
#
#   post "/api/v1/games/#{game.id}/shots", params: json_payload, headers: headers
#
#   expect(response).to be_success
#
#   game = JSON.parse(response.body, symbolize_names: true)
#
#   expected_messages = "Your shot resulted in a Hit. The computer's shot resulted in a Miss."
#   player_2_targeted_space = game[:player_2_board][:rows].first[:data].first[:status]
#
#
#   expect(game[:message]).to eq expected_messages
#   expect(player_2_targeted_space).to eq("Hit")
# end
#
# it "updates the message and board with a miss" do
#   allow_any_instance_of(AiSpaceSelector).to receive(:fire!).and_return("Miss")
#
#   headers = { "CONTENT_TYPE" => "application/json" }
#   json_payload = {target: "A1"}.to_json
#
#   post "/api/v1/games/#{game.id}/shots", params: json_payload, headers: headers
#
#   expect(response).to be_success
#
#   game = JSON.parse(response.body, symbolize_names: true)
#
#   expected_messages = "Your shot resulted in a Miss. The computer's shot resulted in a Miss."
#   player_2_targeted_space = game[:player_2_board][:rows].first[:data].first[:status]
#
#
#   expect(game[:message]).to eq expected_messages
#   expect(player_2_targeted_space).to eq("Miss")
# end
#
# it "updates the message but not the board with invalid coordinates" do
#   player_1_board = Board.new(1)
#   player_2_board = Board.new(1)
#   game = create(:game, player_1_board: player_1_board, player_2_board: player_2_board)
#
#   headers = { "CONTENT_TYPE" => "application/json" }
#   json_payload = {target: "B1"}.to_json
#   post "/api/v1/games/#{game.id}/shots", params: json_payload, headers: headers
#
#   game = JSON.parse(response.body, symbolize_names: true)
#   expect(game[:message]).to eq "Invalid coordinates."
# end
