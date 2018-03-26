# Background: The registration process will trigger this story

require 'rails_helper'

describe "As a non-activated user" do
  scenario "When I check my email for the registration email" do
    visit root_path

    click_on "Register"

    expect(current_path).to eq("/register")

    fill_in "email", with: "katy.jane8@gmail.com"
    fill_in "name", with: "katy"
    fill_in "password", with: "pizza"
    fill_in "password_confirmation", with: "pizza"

    click_on "Submit"

    email = ActionMailer::Base.deliveries.last
    expect(email.subject).to have_content("Welcome! Please complete registration")
    expect(email).to have_content("Visit here to activate your account.")
  end

  scenario "I finish registration" do
    user = create(:user)

    visit "https://command-battleshift.herokuapp.com/activate"

    
    # And when I click on that link
    # Then I should be taken to a page that says "Thank you! Your account is now activated."
    #
    # And when I visit "/dashboard"
    # Then I should see "Status: Active"
  end
end
