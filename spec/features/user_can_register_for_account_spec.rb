require 'rails_helper'

describe 'User' do
  describe 'User visits home page' do
    scenario 'should be able to register for an account' do
      visit '/'
      click_on 'Register'

      expect(current_path).to eq('/register')

      fill_in 'email', with: 'adam.n.conway@gmail.com'
      fill_in 'name', with: 'Adam'
      fill_in 'password', with: 'password'
      fill_in 'password_confirmation', with: 'password'

      click_on 'Submit'

      expect(current_path).to eq('/dashboard')
      expect(page).to have_content("Logged in as Adam")
      expect(page).to have_content("This account has not yet been activated. Please check your email.")
    end
  end
end
