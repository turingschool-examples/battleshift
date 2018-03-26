require "rails_helper"

describe "As a guest user" do
  describe "when I visit /" do
    it "I can click on register and be on the registration page" do
      visit root_path

      click_on "Register"

      expect(current_path).to eq(register_path)
      expect(page).to have_content("Register to Play")
    end

    it "I can register" do
      visit register_path

      fill_in "email", with: "arbitraryemail@thisisntreal.co"
      fill_in "name", with: "Opakawagalaga Eupanifahorious"
      fill_in "password", with: "password"
      fill_in "password_confirmation", with: "password"
      click_on "Create Account"

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("Logged in as Opakawagalaga Eupanifahorious")
      expect(page).to have_content("This account has not been activated")
      expect(page).to have_content("Please check your email")
      expect(User.count).to eq(1)
      expect(User.first.name).to eq("Opakawagalaga Eupanifahorious")
      expect(true).to be(true)
    end
  end
end
