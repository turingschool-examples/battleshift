require 'rails_helper'

describe 'as player 1' do
  context 'send a request to player 2' do
    it 'creates a game' do
      user = create(:activated_user)
      user_2 = create(:activated_user_2)

      conn = Faraday.new(:url => 'localhost:3000')

      response = conn.post do |req|
        req.url '/api/v1/games'
        req.headers['Content-Type'] = 'application/json'
        req.headers['Authorization'] = "#{user.api_key}"
      end

      binding.pry

      expect(response).to be_success
      #test that both are in the system
    end
  end
end
