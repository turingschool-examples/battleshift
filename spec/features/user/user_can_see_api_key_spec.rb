require 'rails_helper'

feature 'API Key' do
  scenario 'user receives API key in email' do
    let(:user) {
      mock_model User,
      name:  'Thor',
      email: 'tylerlundgren@yahoo.com'
    }

    let(:mail) {
      describe_class.instructions(user).deliver_now
    }
    # When I check my email for the registration email
    # Then I should see a unique API key to use for making API calls
    expect(mail.body).to have_content('Here is your API Key:')
  end
end
