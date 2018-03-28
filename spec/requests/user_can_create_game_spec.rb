require 'rails_helper'

describe "Api::V1::Games" do
  context "POST /api/v1/games" do
  let(:user_1) {create(:user)}
  let(:user_2) {create(:user, email: "ellen@ellen.com")}
    it "starts the game" do
      user_1.api_key = create(:api_key, user: user_1)
      user_2.api_key = create(:api_key, api_key: "542345243642", user: user_2)

      post "/api/v1/games"

      result = JSON.parse(response.body)

      expect(response).to be_success
      expect(result[:id]).to eq(1)
    end
  end
end
