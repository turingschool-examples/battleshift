require 'rails_helper'

describe 'user registration process' do
  let(:user) { create(:unregistered_user) }

  context 'a non-activiated user' do
    context 'confirms email activiation' do
      scenario 'they are successfully registered' do
        welcome_message  = 'Thank you! Your account is now activated.'

        visit activiation_path
        
        click_on 'Activate'

        expect(current_path).to eq(user_path(user))
        expect(page).to have_content(welcome_message)
        expect(user.registered?).to eq(true)
      end
    end
  end
end
