require 'rails_helper'

feature 'Registration' do
  scenario 'user can register for account' do
    # As a guest user
    # When I visit "/"
    visit '/'
    # And I click "Register"
    click_on 'Register'
    # Then I should be on "/register"
    expect(current_path).to eq('/register')
    # And when I fill in an email address (required)
    fill_in 'user[email]', with: 'tylerlundgren@yahoo.com'
    # And I fill in name (required)
    fill_in 'user[name]', with: 'Thor'
    # And I fill in password and password confirmation (required)
    fill_in 'user[password]', with: 'test'
    fill_in 'user[password_confirmation]', with: 'test'
    # And I click submit
    click_on 'Submit'

    # Then I should be redirected to "/dashboard"
    expect(current_path).to eq('/dashboard')

    # And I should see a message that says "Logged in as <SOME_NAME>"
    # And I should see "This account has not yet been activated. Please check your email."
    expect(page).to have_content('Logged in as Thor')
    expect(page).to have_content('This account has not yet been activated. Please check your email.')
  end

  scenario 'registered user can log back in' do
    user = create(:user)
    visit '/'

    click_on 'Login'
    expect(current_path).to eq(login_path)

    fill_in 'email', with: user.email
    fill_in 'password', with: user.password

    click_on 'Submit'

    expect(current_path).to eq('/dashboard')
    expect(page).to have_content("Logged in as #{user.name}")
  end
end
