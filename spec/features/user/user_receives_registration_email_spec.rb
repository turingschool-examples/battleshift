require 'rails_helper'

feature 'Registration' do
  scenario 'user receives confirmation email post registery' do
    bob = create(:user)

    visit root_path

    click_on 'Login'

    fill_in 'email', with: bob.email
    fill_in 'password', with: bob.password

    click_on 'Submit'

    expect(current_path).to eq(dashboard_path)
    visit "/activate?id=#{bob.id}"

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content('Status: Active')
    expect(page).to have_content('Thank you! Your account is now activated.')
    expect(page).to_not have_content('This account has not yet been activated')
  end
end
