require 'rails_helper'

describe 'post api/v1/games' do
  it 'can create a new game' do
    user_1 = create(:user)
    user_2 = create(:user, auth_token: "kasvkb495489", email: "fakeymcfake@fake.com")

    headers = { "CONTENT_TYPE" => "application/json", "X-API-KEY" => "#{user_1.auth_token}"}
    json_payload = {opponent_email: "#{user_2.email}"}.to_json

    post = post "/api/v1/games", params: json_payload, headers: headers

    game = Game.last

    expect(Game.count).to eq(1)
  end

  it "can not create a game with invalid information" do
    user_1 = create(:user)

    headers = { "CONTENT_TYPE" => "application/json", "X-API-KEY" => "#{user_1.auth_token}"}
    json_payload = {opponent_email: "0js09j0jads"}.to_json

    post = post "/api/v1/games", params: json_payload, headers: headers

    expect(Game.count).to eq(0)
  end
end
