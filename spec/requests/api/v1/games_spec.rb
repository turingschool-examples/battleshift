require 'rails_helper'

describe 'User starts new game with opponent email' do
  it 'player 1 api_key and opponent email 1' do
    user_1 = create(:user, active: true)
    user_2 = create(:user, username: 'blob', email: 'dude@dudeness.yo')

    visit activate_url(token: user_1.api_token)

    

    headers = { "CONTENT_TYPE" => "application/json" }
    json_payload = {target: "A1"}.to_json

    post "/api/v1/games", params: {"opponent_email" => user_2.email, "api_key" => user_1.api_token}
  end
end
