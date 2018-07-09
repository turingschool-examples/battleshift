require 'rails_helper'

describe 'guest user can register for an account' do
  it 'can navigate to register page' do
    visit '/'
    click_link 'Register'

    expect(current_path).to eq('/register')
  end
  it 'can fill out a form' do
    visit '/register'

    email = 'example@example.com'
    name = 'Joe Smith'
    password = '123'

    fill_in 'user[email]', with: email
    fill_in 'user[name]', with: name

    within('.first_password') do
      fill_in 'user[password]', with: password
    end

    within('.password_confirmation') do
        fill_in 'user[password_confirmation]', with: password
    end
    click_button 'Sign up'

    expect(current_path).to eq('/dashboard')
    expect(page).to have_content("Logged in as #{name}")
    expect(page).to have_content('This account has not been activated. Please check your email.')
  end
  xit 'does not submit invalid form' do
    name = 'Joe Smith'
    password = '123'
    confirm_password = '122'

    fill_in 'user[name]', with: name
    fill_in 'user[password]', with: password
    fill_in 'user[confirm_password]', with: confirm_password
    click_button 'Sign up'

    expect(current_path).to eq('/register')
    expect(page).to have_content('Please fill out all required fields.')
  end
end
