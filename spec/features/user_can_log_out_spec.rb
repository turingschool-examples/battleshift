require "rails_helper"

describe "Logged in user" do
  context "inactive account" do
    it "can log out" do
      user = create(:user)
      visit login_path

      fill_in "email", with: user.email
      fill_in "password", with: user.password
      click_on "Log In"

      click_on "Log out"

      expect(current_path).to eq(root_path)
      expect(page).to have_content("Successfully logged out")
      expect(page).to_not have_content("Log out")
    end
  end

  context "active account" do
    it "can log out" do
      user = create(:user, status: 1)
      visit login_path

      fill_in "email", with: user.email
      fill_in "password", with: user.password
      click_on "Log In"

      click_on "Log out"

      expect(current_path).to eq(root_path)
      expect(page).to have_content("Successfully logged out")
      expect(page).to_not have_content("Log out")
    end
  end

end
