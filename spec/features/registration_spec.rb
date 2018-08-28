require 'rails_helper'

describe 'visitor' do 
  context 'visiting the root path' do
    it 'can create a new account' do 
      name = 'Sample name'
      email = 'sample@email.com'
      password = 'sample password'

      visit '/'
      
      click_button 'Register'

      expect(current_path).to eq('/register')
        fill_in 'user[name]', with: name
        fill_in 'user[email]', with: email
        fill_in 'user[password]', with: password
        fill_in 'user[password_confirmation]', with: password
        click_button 'Submit'

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("Logged in as #{name}")
      expect(page).to have_content('This account has not yet been activated. Please check your email.')
    end
  end
end