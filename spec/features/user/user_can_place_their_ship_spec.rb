require 'rails_helper'

describe 'as a user' do
  context 'they place a ship' do
    it 'is correctly placed' do
      user = create(:activated_user)
      user_2 = create(:activated_user)
      player_1_board = Board.new(4)
      player_2_board = Board.new(4)
      game = Game.create(player_1_board: player_1_board, player_2_board: player_2_board)

      conn = Faraday.new(:url => 'http://localhost:3000')

      response = conn.post do |req|
        req.url "/api/v1/#{game.id}/ships"
        req.headers['Content-Type'] = 'application/json'
        req.headers['X-API-Key'] = user.api_key
        req.body = '{ "player_2_email": "foo21@foo.com" }'
      end

      expect(response).to be_successful
    end
  end
end
