require 'rails_helper'

describe 'As a guest user' do
  context "When I visit / I can register for an account" do
    it "I can register for an account" do
      visit "/"
      click_on "Register"

      expect(current_path).to eq "/register"

      fill_in "user[email]", with: 'ilanarox@fake.com'
      fill_in "user[name]", with: 'Josh'
      fill_in "user[password]", with: 'vErYsEcUrE'
      fill_in "user[password_confirmation]", with: 'vErYsEcUrE'
      click_on "Submit"

      expect(current_path).to eq "/dashboard"

      user = User.last
      expect(user.name).to eq('Josh')
      expect(user.email).to eq('ilanarox@fake.com')

      expect(page).to have_content "Logged in as Josh"
      expect(page).to have_content "This account has not yet been activated. Please check your email."

      email = ActionMailer::Base.deliveries.last

      expect(email.subject).to include(user.name)
      expect(email.html_part.body.to_s).to have_content("Visit here to activate your account.")

      link = email.html_part.body.raw_source.match(/href="(?<url>.+?)">/)[:url]
      binding.pry
      visit(link)

      expect(current_path).to eq("/dashboard")
      expect(page).to have_content("Thank you! Your account is now activated.")
      expect(page).to have_content("Status: Active")
    end
  end
end
