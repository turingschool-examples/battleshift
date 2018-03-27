require 'rails_helper'

describe "as a guest user" do
  scenario "when I visit the root, I can register as a user" do
    visit root_path

    click_on "Register"

    expect(current_path).to eq(register_path)

    fill_in "email", with: "user@user.com"
    fill_in(:name, with: "katy")
    fill_in(:password, with: "pizza")
    fill_in(:password_confirmation, with: "pizza")

    click_on "Submit"

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Logged in as katy")
    expect(page).to have_content("This account has not yet been activated. Please check your email.")
  end
end
