require 'rails_helper'

describe 'as player 1' do
  context 'send a request to player 2' do
    it 'creates a game' do
      user, user2 = create_list(:activated_user, 2)

      conn = Faraday.new(:url => 'http://localhost:3000')

      response = conn.post do |req|
        req.url '/api/v1/games'
        req.headers['Content-Type'] = 'application/json'
        req.headers['X-API-Key'] = user.api_key
        req.body = { 'player_2_email': user2.email }.to_json
      end

      expect(response).to be_success
    end
  end
end
