require 'rails_helper'

describe 'Registered User', type: :request do
  let(:user1) { create(:user) }
  let(:user2) { create(:user) }
  let(:user3) { create(:user, activated: false)}
  context 'after logging in' do
    it 'can create a new game by sending a post request with an API key and another players username' do
      post "/api/v1/games", params: { game: { api_key: user1.api_key, player_2_username: user2.username } }

      expect(response.code).to eq(200)
      expect(Game.last.player_1_id).to eq(user1.id) 
      expect(Game.last.player_1_api_key).to eq(user1.api_key) 
      expect(Game.last.player_2_id).to eq(user2.id) 
      expect(Game.last.player_2_api_key).to eq(user2.api_key) 
    end

    it 'will receive a message if player 2 is not registered in the system' do
      post "/api/v1/games", params: { game: { api_key: user1.api_key, player_2_username: "example@example.com" } }

      expect(response.code).to eq(400)
      expect(response.body[:message]).to eq("Your oponent must create an account before you can play a game. They can check their email for a registration link.")
    end
  end
end