require 'rails_helper'

feature 'Registration' do
  scenario 'user receives confirmation email post registery' do
    # Background: The registration process will trigger this story
    let(:user) {
      mock_model User,
      name:  'Thor',
      email: 'tylerlundgren@yahoo.com'
    }

    let(:mail) {
      describe_class.instructions(user).deliver_now
    }
    # As a non-activated user
    expect(user.status).to eq(0)
    # When I check my email for the registration email
    expect(mail.subject).to eq('Confirm your registration')

    # I should see a message that says "Visit here to activate your account."
    expect(mail.body).to have_content('Visit here to activate your account.')
    # And when I click on that link
    click_on 'activate'
    # Then I should be taken to a page that says "Thank you! Your account is now activated."
    expect(current_path).to eq('/activated')
    expect(page).to have_content('Thank you! Your account is now activated.')
    # And when I visit "/dashboard"
    visit '/dashboard'
    # Then I should see "Status: Active"
    expect(page).to have_content('Status: Active')
  end
end
