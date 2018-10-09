require 'rails_helper'

feature 'Guest user sees user information' do 
  scenario 'user name and user email address' do 
    user = User.create(name: 'Josiah Bartlet', email: 'jbarlet@example.com')
    # As a guest user
    # When I visit "/users/1"
    visit "/users/1"
    
    # Then I should see the user's name Josiah Bartlet
    # And I should see the user's email address jbartlet@example.com
    expect(page).to have_content(user.name)
    expect(page).to have_content(user.email)
  end 
end