require 'rails_helper'

describe 'a user' do
  describe 'logged in on the dashboard' do
    it 'can log out successfuly' do
      user = User.create(name: 'Angela', email: 'Bob@Bob.Bob', password: 'Bob')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit dashboard_path
      click_on 'Log Out'

      expect(current_path).to eq(root_path)
      expect(page).to have_content('Welcome to BattleShift!')
    end
  end
end
