require 'rails_helper'

describe 'create a game' do
  it 'can_create_a_game' do
    user1 = create(:user)
    user2 = create(:user2)

    post "/api/v1/games?opponent_email=#{user2.email}", headers: { 'X-API-Key': user1.api_key, 'CONTENT_TYPE': 'application/json'}

    data = JSON.parse(response.body)
    expect(data).to be_a(Hash)
    expect(data["current_turn"]).to eq("player 1")
  end
end
