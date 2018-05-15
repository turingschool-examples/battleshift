require 'rails_helper'

describe 'User' do
  describe 'visits root path and clicks on registration link' do
    it 'and is directed to registration path' do
      visit '/'

      click_on 'Register'

      expect(current_path).to eq('/register')
    end
  end

  describe 'fills out a registration form' do
    it 'and it creates an account' do
      visit '/register'

      fill_in 'user[email]', with: 'email@example.com'
      fill_in 'user[username]', with: 'username'
      fill_in 'user[password]', with: 'password'
      fill_in 'user[password_confirmation]', with: 'password'
      click_on 'Create User'

      expect(current_path).to eq('/dashboard')
      expect(page).to have_content("Logged in as #{User.last.username}")
      expect(page).to have_content('This account has not yet been activated. Please check your email.')
    end
  end
end
