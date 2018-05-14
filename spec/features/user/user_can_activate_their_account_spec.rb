require 'rails_helper'

context 'A user clicking the activate link in an email' do
  let(:user) { create(:user) }
  scenario 'can activate their account' do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/dashboard'

    expect(page).to have_content('This account has not been activated yet.')

    visit "/activate/#{user.activation_key}"

    expect(page).to have_content('Thank you! Your account is now activated.')
    user.reload

    visit '/dashboard'

    expect(page).to have_content("Logged in as #{user.name}")
    expect(page).to_not have_content('This account has not been activated yet.')
    expect(page).to have_content('Status: Active')
  end
end
