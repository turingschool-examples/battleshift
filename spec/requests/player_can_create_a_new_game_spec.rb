require 'rails_helper'

describe 'Activated User Starts a new game' do
  scenario 'by hitting /api/v1/games?options=<opponent_email>' do
    it 'will create a new game between user and opponent' do
      user = create(:user)
      opponent = create(:user)
      opponent_email = opponent.email

      options = { opponent_email: opponent_email }
      post "/api/v1/games"
    end
  end
end



=begin
  options = { opponent_email: ENV["BATTLESHIFT_OPPONENT_EMAIL"] 
    endpoint = "/api/v1/games"
    payload = options.to_json
response = post_json(endpoint, payload)
=end