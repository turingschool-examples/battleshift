require 'rails_helper'

describe 'post api/v1/games' do
  it 'can create a new game' do
    test_user = create(:user)
    second_user = create(:user, auth_token: "kasvkb495489", email: "fakeymcfake@fake.com")



    endpoint = "/api/v1/games"
    #TODO: how do we json post with a body of test_user.auth_token
    Game.create(
      player_1_auth_token: params[:auth_token]
      player_2_email: params[:email]
    )

    headers = { "CONTENT_TYPE" => "application/json", "auth_token" => "#{test_user.auth_token}"}
    json_payload = {email: "#{user.email}"}.to_json





    post "/api/v1/games/#{game.id}/shots", params: json_payload, headers: headers
  end




end
