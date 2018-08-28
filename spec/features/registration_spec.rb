require 'rails_helper'


describe 'A user visits the registration page' do
  it 'registers the user' do
    visit '/register'

    fill_in :user_email, with: 'test@test.com'
    fill_in :user_name, with: 'connor'
    fill_in :user_password, with: '12345'
    fill_in :user_password_confirmation, with: '12345'

    click_on 'Submit'

    expect(current_path).to eq('/dashboard')
    expect(page).to have_content("Logged in as connor")
    expect(page).to have_content("This account has not yet been activated. Please check your email.")
  end
end
