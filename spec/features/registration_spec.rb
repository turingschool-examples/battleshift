require 'rails_helper'
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

describe 'visitor' do 
  context 'visiting the root path' do
    it 'can create a new account' do 
      name = 'sample name'
      email = 'sample@email.com'
      password = 'sample password'

      visit '/'

      click_button 'Register'

      expect(current_path).to eq('/register')
      
        fill_in :user_name, with: name
        fill_in :user_email, with: email
        fill_in :user_password, with: password

      click_button 'Submit'

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("Logged in as #{name}!")
      expect(page).to have_content('This account has not yet been activated. Please check your email.')
    end
  end
end