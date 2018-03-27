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

    email = ActionMailer::Base.deliveries.last
    expect(email.subject).to have_content("Welcome! Please complete registration")
    expect(email).to have_content("Visit here to activate your account.")

    visit activate_path(activation_key: User.last.activation_key.activation_key)

    expect(current_path).to eq(activate_success_path)
    expect(page).to have_content("Thank you! Your account is now activated.")

    visit dashboard_path

    expect(page).to have_content("Status: Active")
  end
end
