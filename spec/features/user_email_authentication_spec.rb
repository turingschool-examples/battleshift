require 'rails_helper'

describe 'User visits root' do
  context 'clicks register' do
    it 'fills out registeration form and is redirected to dashboard_path' do
      visit root_path

      click_on 'Register'

      expect(current_path).to eq(register_path)

      name = 'Dude'

      fill_in :user_username, with: name
      fill_in :user_email, with: 'chris.ian.powell@gmail.com'
      fill_in :user_password, with: 'You76734'

      click_on 'Submit'

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("Logged in as #{name}")
      expect(page).to have_content("This account has not been activated. Please check your email.")
    end
  end
end
