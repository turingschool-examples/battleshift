require 'rails_helper'

describe 'As a user' do
  context 'when I visit /' do
    scenario 'and I click register, I can register for an account' do
      visit '/'

      click_on 'Register'

      expect(current_path).to eq('/register')

      fill_in 'user[email]', with: 'foo@foo.com'
      fill_in 'user[name]', with: 'Thanos'
      fill_in 'user[password]', with: '50/50'
      fill_in 'user[password_confirmation]', with: '50/50'

      click_on 'Submit'

      expect(current_path).to eq('/dashboard')

      expect(page).to have_content('Logged in as Thanos')
      expect(page).to have_content('This account has not been activated yet. Please check your email.')
    end
  end
end
