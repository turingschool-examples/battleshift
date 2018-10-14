require 'rails_helper'
#
# # Background: The registration process will trigger this story
# #
# # As a non-activated user
describe 'As a non-activated user' do
  context 'they check their email for the registration email' do
    it "shows a message that says 'Visit here to activate your account'" do
      user = User.create(
                         name: "Tara Craig",
                         email: "tcraig@aol.com",
                         password: "password",
                         api_key: SecureRandom.urlsafe_base64,
                         activated: true
                       )

      visit "/activation/#{user.id}?api_key=#{user.api_key}"

      expect(page).to have_content("Thank you! Your account is now activated.")

      visit "/dashboard?api_key=#{user.api_key}"

      expect(page).to have_content("Status: Active")
    end
  end
end
# # When I check my email for the registration email
# # I should see a message that says "Visit here to activate your account."
# # And when I click on that link
# # Then I should be taken to a page that says "Thank you! Your account is now activated."
# #
# # And when I visit "/dashboard"
# # Then I should see "Status: Active"
