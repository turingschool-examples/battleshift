require 'rails_helper'

describe 'user registration process' do
  let(:user) { create(:user) }
  let(:email) { UserMailer.signup }

  context 'a non-activiated user' do
    context 'confirms email activiation' do
      scenario 'they are successfully registered' do
        register_message = 'Visit here to activate your account.'
        welcome_message  = 'Thank you! Your account is now activated.'

        expect(email.body).to match(register_message)
        
        click_on welcome_message

        expect(current_path).to eq(registration_path)
        expect(page).to have_content(welcome_message)
        expect(user.registration).to eq(true)
      end
    end
  end
end
