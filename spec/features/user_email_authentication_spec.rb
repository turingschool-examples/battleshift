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
  context 'has clicked link in email' do
    it "and is directed to activation page and is activated" do
      user = create(:user)

      visit activate_url(token: user.api_token)

      expect(current_path).to eq(activate_path)
      expect(page).to have_content("Thank you! Your account is now activated.")

      click_on "Go to your dashboard."

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content('Status: Active')
    end
    it "is already active and is redirected to login_path" do
      user = create(:user, active: true)

      visit activate_url(token: user.api_token)

      expect(current_path).to eq(login_path)
      expect(page).to have_content("This account has already been activated. Please log in.")
    end
  end
end
