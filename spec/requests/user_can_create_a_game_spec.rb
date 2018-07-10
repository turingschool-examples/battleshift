require 'rails_helper'

describe 'create a game' do
  it 'can_create_a_game' do
    user1 = create(:user)
    user2 = create(:user2)

    post '/api/v1/games', headers: { 'X-API-Key': user1.api_key, 'CONTENT_TYPE': 'application/json'}, body: "{'opponent_email': user2.email}"

    binding.pry
  end
end
