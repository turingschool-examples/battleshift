require 'rails_helper'

feature 'Guest user sees user information' do 
  scenario 'user name and user email address' do 
  
    # As a guest user
    # When I visit "/users/1"
    visit "/users/1"
    
    # Then I should see the user's name Josiah Bartlet
    # And I should see the user's email address jbartlet@example.com
    expect(current_page).to have_content(user.name)
    expect(current_page).to have_content(user.email)
  end 
end