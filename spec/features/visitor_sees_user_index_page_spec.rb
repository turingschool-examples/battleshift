require 'rails_helper'

feature 'visitor goes to a user index page' do
  scenario 'they see the users names and email addresses' do
    VCR.use_cassette("visitor_see_names_emails") do
      visit "/users"
    end
      expect(page).to have_content("Josiah Bartlet")
      expect(page).to have_content("Mike Tyson")
      # Then I should see the user's name Josiah Bartlet
      expect(page).to have_content("josiah@example.com")
      expect(page).to have_content("ironmike@happypuppy.com")

    # And I should see the user's email address jbartlet@example.com
  end
end



# Title: Dogfooding GET /api/v1/users/
#
# Background: There are two users stored in the database
#
# As a guest user
# When I visit "/users"
# Then I should see the user's name (for both users)
# And I should see the user's email (for both users)
