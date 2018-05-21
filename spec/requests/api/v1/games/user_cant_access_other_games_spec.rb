require 'rails_helper'

describe "Unauthorized user" do
  let(:player_1) { create(:user)}
  let(:player_2) { create(:user)}
  let(:game) {
    Game.create(
      player_1: Player.new(Board.new(3), player_1.api_key),
      player_2: Player.new(Board.new(3), player_2.api_key)
      )
    }

  it "cannot access other players game" do
    unauth_user = create(:user)

    headers = { "CONTENT_TYPE" => "application/json", "X-API-KEY" => unauth_user.api_key}
    json_payload = {target: "A1"}.to_json

    post "/api/v1/games/#{game.id}/shots", params: json_payload, headers: headers

    expect(response.status).to eq(401)
  end
end
