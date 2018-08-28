require 'rails_helper'

describe 'a user' do
  describe 'visiting the root page' do
    it 'can register for an account' do
      visit '/'
      click_on 'Register'

      expect(current_path).to eq('/register')

      fill_in user[:name], with: 'Bob'
      fill_in user[:email], with: 'Bob@Bob.Bob'
      fill_in user[:password], with: 'Ben'
      fill_in user[:password_confirmation], with: 'Ben'
      click_on 'Submit'

      expect(current_path).to eq('/dashboard')
      expect(page).to have_content('Logged in as Bob')
      expect(page).to have_content('This account has not yet been activated. Please check your email.')
    end
  end
end
