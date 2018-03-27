require "rails_helper"

describe "Logged in user" do
  context "inactive account" do
    it "can log out" do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit root_path
      click_on "Log out"

      expect(current_path).to eq(root_path)
      expect(page).to have_content("Successfully logged out")
    end
  end

  context "active account" do
    it "can log out" do
      user = create(:user, status: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit root_path
      click_on "Log out"

      expect(current_path).to eq(root_path)
      expect(page).to have_content("Successfully logged out")
    end
  end

end
