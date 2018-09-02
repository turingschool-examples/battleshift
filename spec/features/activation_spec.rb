require 'rails_helper'

describe "registered unactivated user" do
  context "clicks link from registration email" do
    it "activates account" do
      user = create(:user)

      user_token = user.user_token

      expect(user.status).to eq('inactive')

      visit activate_url(token: user_token)

      user.reload

      expect(current_path).to eq(dashboard_path)
      expect(user.status).to eq('active')
      expect(page).to have_content("Status: Active")
      expect(page).to have_content("Account successfully activated")
    end
  end
end
