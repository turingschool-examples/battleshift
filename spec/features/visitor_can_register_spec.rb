require 'rails_helper'

describe "As a visitor" do
  context "they visit the root path" do
    it 'allows them to register' do
      # As a guest user
      # When I visit "/"
      visit '/'
      # And I click "Register"
      click_on "Register"
      # Then I should be on "/register"
      expect(current_path).to eq("/register")
      # And when I fill in an email address (required)
      # And I fill in name (required)
      # And I fill in password and password confirmation (required)
      fill_in :user_email, with: "bob@123@gmail"
      fill_in :user_name, with: "Bob Saget"
      fill_in :user_password, with: "password"
      fill_in :user_password_confirmation, with: "password"
      # And I click submit
      click_on "Submit"
      # Then I should be redirected to "/dashboard"
      expect(current_path).to eq("/dashboard")
      # And I should see a message that says "Logged in as <SOME_NAME>"
      expect(page).to have_content("Logged in as Bob Saget")
      # And I should see "This account has not yet been activated. Please check your email."
      expect(page).to have_content("This account has not yet been activated. Please check your email.")
    end
  end
end
