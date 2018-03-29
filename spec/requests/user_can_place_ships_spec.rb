require 'rails_helper'

describe "Api::V1::Games" do
  context "POST /api/v1/games/:id/ships" do
    let(:user_1) {create(:user)}
    let(:user_2) {create(:user, email: "ellen@ellen.com")}

    it "places ships" do
      user_1.api_key = create(:api_key, user: user_1)
      user_2.api_key = create(:api_key, api_key: "542345243642", user: user_2)
      headers = { "X-API-KEY" => user_1.api_key.api_key,
                  "CONTENT-TYPE" => "application/json" }
      params = { :opponent_email => "#{user_2.email}" }.to_json
      post "/api/v1/games", :params => params, :headers => headers

      ship_payload = {ship_size: 3, start_space: "A1", end_space: "A3"}

      post "/api/v1/games/#{Game.last.id}/ships", :params => { ship: ship_payload }

      result = JSON.parse(response.body)

      expect(response).to be_success

      # expect(game_data[:player_1_board][:rows].count).to eq(board_size)
      expect(result[:message]).to include("Successfully placed ship with a size of 3. You have 1 ship(s) to place with a size of 2.")
    end
  end
end
