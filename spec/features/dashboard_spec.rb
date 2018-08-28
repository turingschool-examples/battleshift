require 'rails_helper'

describe 'a logged in user' do
  describe 'visiting the dashboard page as an unverified user' do
    it 'can see inactive status on their account' do
      user = User.create(name: 'Angela', email: 'Bob@Bob.Bob', password: 'Bob')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit dashboard_path

      expect(page).to have_content('This account has not yet been activated. Please check your email.')
    end
  end

  describe 'visiting the dashboard page as a verified user' do
    it 'can see active status on their account' do
      user = User.create(name: 'Angela', email: 'Bob@Bob.Bob', password: 'Bob', status: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit dashboard_path

      expect(page).to have_content('Status: Active')
    end
  end
end
