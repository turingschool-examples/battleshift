require 'rails_helper'

describe 'As a user' do
  context 'when I visit activate account link' do
    scenario 'I see a thank you page and my account is activated' do
      user = create(:user)
      
      expect(user.status).to eq('Inactive')

      visit '/activate'

      expect(page).to have_content('Thank you! Your account is now activated.')
      expect(user.status).to eq('Active')
    end
  end
end
