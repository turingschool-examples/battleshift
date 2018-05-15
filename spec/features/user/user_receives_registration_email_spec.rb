require 'rails_helper'

feature 'Registration' do
  scenario 'user receives confirmation email post registery' do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path

    click_on 'Login'

    fill_in 'email', with: user.email
    fill_in 'password', with: user.password

    click_on 'Submit'
    expect(current_path).to eq(dashboard_path)

    visit "/activate?id=#{user.id}"

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content('Status: Active')
    expect(page).to have_content('Thank you! Your account is now activated.')
    expect(page).to_not have_content('This account has not yet been activated')
  end
end
