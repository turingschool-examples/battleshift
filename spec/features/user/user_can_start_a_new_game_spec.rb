require 'rails_helper'

describe 'as player 1' do
  context 'send a request to player 2' do
    it 'creates a game' do
      user = create(:activated_user)
      user = create(:activated_user_2)

      response = Faraday.post do |req|
        req.url '/api/v1/games'
        req.headers['Content-Type'] = 'application/json'
        req.headers['Authorization'] = "#{activated_user.api_key}"
        req.body = '{ "player_2_email": "foo2#{n}@foo.com"}'
      end

      expect(response).to be_success
      #test that both are in the system
    end
  end
end
