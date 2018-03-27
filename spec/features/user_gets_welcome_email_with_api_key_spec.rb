require 'rails_helper'

describe "As a non-activated user" do
  scenario "I complete my registration through an email link" do
    visit root_path

    click_on "Register"

    expect(current_path).to eq(register_path)

    fill_in "email", with: "katy.jane8@gmail.com"
    fill_in "name", with: "katy"
    fill_in "password", with: "pizza"
    fill_in "password_confirmation", with: "pizza"

    click_on "Submit"

    visit activate_path(activation_key: User.last.activation_key.activation_key)

    email = ActionMailer::Base.deliveries.last
    expect(email.subject).to have_content("Welcome to Command Battleshift!")
    expect(email).to have_content("Your API key is: #{User.last.api_key.api_key}")
    expect(email).to have_content("To login to the site, just follow this link:")
  end
end
