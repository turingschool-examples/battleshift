require 'rails_helper'

describe 'post api/v1/games' do
  it 'can create a new game' do
    user_1 = create(:user)
    user_2 = create(:user, auth_token: "kasvkb495489", email: "fakeymcfake@fake.com")

    headers = { "CONTENT_TYPE" => "application/json", "auth_token" => "#{user_1.auth_token}"}
    json_payload = {email: "#{user_2.email}"}.to_json

    post = post "/api/v1/games", params: json_payload, headers: headers

    game = Game.last

    expect(Game.count).to eq(1)
    expect(game).to have_key(:player_1_auth_token)
    expect(game).to have_key(:player_2_auth_token)
  end
end
