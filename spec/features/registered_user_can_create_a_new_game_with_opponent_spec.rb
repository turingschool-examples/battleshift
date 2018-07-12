require 'rails_helper'

describe 'Registered User' do
  context 'after logging in' do
    it 'can create a new game by sending a post request with an API key and another players username' do
      user1 = create(:user)
      user2 = create(:user)
      params = {
        api_key:            user1.api_key,
        player_2_username:  user2.username
      }
      
      post :api_v1_games, params

      expect(response.code).to eq(200)
    end
  end
end