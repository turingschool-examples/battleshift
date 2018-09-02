require 'rails_helper'

describe 'User starts new game with opponent email' do
  context 'POST /api/v1/games' do
    it 'creates a new game with player 1 api_key and opponent email' do
      user_1 = create(:user, active: true)
      user_2 = create(:user, active: true, username: 'blob', email: 'dude@dudeness.yo')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_1)

      headers = { "CONTENT_TYPE" => "application/json" }
      headers['X-API-Key'] = user_1.api_token
      json_payload = {opponent_email: user_2.email}.to_json

      expect(Game.count).to eq(0)

      post "/api/v1/games", params: json_payload, headers: headers

      expect(Game.count).to eq(1)
    end
  end
end
