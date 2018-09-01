require 'rails_helper'

describe 'User starts new game with opponent email' do
  context 'POST /api/v1/games' do
    let(:player_1_board)   { Board.new(4) }
    let(:player_2_board)   { Board.new(4) }
    let(:sm_ship) { Ship.new(2) }
    let(:game)    {
      create(:game,
        player_1_board: player_1_board,
        player_2_board: player_2_board
      )
    }

    it 'player 1 api_key and opponent email 1' do
      user_1 = create(:user, active: true)
      user_2 = create(:user, username: 'blob', email: 'dude@dudeness.yo')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_1)

      headers = { "CONTENT_TYPE" => "application/json" }
      json_payload = {opponent_email: user_2.email}.to_json

      post "/api/v1/games", params: json_payload, headers: headers
    end
  end
end
