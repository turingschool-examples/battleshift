require 'rails_helper'


feature 'visitor goes to a user show page' do
  scenario 'they see the user name and email address' do
    VCR.use_cassette("visitor_see_user_name_email") do
      visit "/users/1"
    end
      expect(page).to have_content("Josiah Bartlet")
      expect(page).to have_content("josiah@example.com")
  end
end
