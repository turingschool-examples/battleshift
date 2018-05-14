require 'rails_helper'

describe 'Guest user can register' do
  describe 'they visit root path' do
    it 'they can register as a user' do


      visit root_path

      click_on 'Register'

      expect(current_path).to eq(register_path)

      fill_in 'Email', with: 'testemail@email.com'
      fill_in 'Name', with: 'Awesome Guys'

      fill_in 'Password', with: 'secretpassword'
      fill_in 'Password Confirmation', with: 'secretpassword'

      click_on 'Submit'

      expect(current_path).to eq('/dashboard')
      expect(page).to have_content('Logged in as Awesome Guys')
      expect(page).to have_content('This account has not yet been activated. Please check your email.')
    end
  end
end
