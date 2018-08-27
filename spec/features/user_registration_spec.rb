require 'rails_helper'

describe "An Unregistered User" do
  context "Visiting root path" do
    it "can click register to create an acount and be sent an email to activate account" do
      visit '/'

      click_link 'Register'

      expect(current_path).to eq(registration_path)
      attributes = {
                    email:    'fake@123.com',
                    name:     'Captain',
                    password: 'password'
                   }
      fill_in 'Email',	with: attributes[:email]
      fill_in 'Name',	with: attributes[:name]
      fill_in 'Password',	with: attributes[:password]
      fill_in 'Confirm Password',	with: attributes[:password]

      click_button 'Submit'

      expect(current_path).to eq(dashboard_path)
      expect(current_page).to have_content("Logged in as #{attributes[:name]}")             
      expect(current_page).to have_content("This account has not yet been activated. Please check your email.")
    end
  end
end

=begin
As a guest user
When I visit "/"
And I click "Register"
Then I should be on "/register"
And when I fill in an email address (required)
And I fill in name (required)
And I fill in password and password confirmation (required)
And I click submit
Then I should be redirected to "/dashboard"
And I should see a message that says "Logged in as <SOME_NAME>"
And I should see "This account has not yet been activated. Please check your email."
=end