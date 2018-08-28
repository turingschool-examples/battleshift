require 'rails_helper'

describe 'a user' do
  describe 'visiting the root page' do
    it 'can log in successfuly' do
      user = User.create(name: 'Angela', email: 'Bob@Bob.Bob', password: 'Bob')
      visit '/'
      click_on 'Log In'

      expect(current_path).to eq('/login')

      fill_in :email, with: user.email
      fill_in :password, with: user.password
      click_on 'Submit'

      expect(current_path).to eq('/dashboard')
      expect(page).to have_content('Logged in as Angela')
    end
    it 'can not log in with bad credentials' do
      user = User.create(name: 'Angela', email: 'Bob@Bob.Bob', password: 'Bob')
      visit '/'
      click_on 'Log In'

      expect(current_path).to eq('/login')

      fill_in :email, with: user.email
      fill_in :password, with: 'Sally'
      click_on 'Submit'

      expect(page).to have_content('Log in to your account')
    end
  end
end
