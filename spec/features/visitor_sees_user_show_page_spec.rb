require 'rails_helper'


feature 'visitor goes to a user show page' do
  scenario 'they see the user name and email address' do

    visit "/users/1"
    expect(page).to have_content("Josiah Bartlet")
    expect(page).to have_content("jbartlet@example.com")
  end
end
