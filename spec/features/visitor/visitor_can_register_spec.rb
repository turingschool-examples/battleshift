require 'rails_helper'

describe "As a visitor" do
  context "when I visit root and click register" do
    scenario "I am forwarded into register path" do
      visit root_path

      click_on "Register"

      expect(current_path).to eq("/register")
    end
  end
end


# As a guest user
# When I visit "/"
# And I click "Register"
# Then I should be on "/register"
# And when I fill in an email address (required)
# And I fill in name (required)
# And I fill in password and password confirmation (required)
# And I click submit
# Then I should be redirected to "/dashboard"
# And I should see a message that says "Logged in as <SOME_NAME>"
# And I should see "This account has not yet been activated. Please check your email."
