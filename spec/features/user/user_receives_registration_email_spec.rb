require 'rails_helper'

feature 'Registration' do
  scenario 'user receives confirmation email post registery' do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    # Background: The registration process will trigger this story

    # visit dashboard_path
    #
    # expect(page).to have_content('This account has not yet been activated')

    visit "/activate?id=#{user.id}"
    require 'pry'; binding.pry

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content('Status: Active')
    expect(page).to have_content('Thank you! Your account is now activated.')
    expect(page).to_not have_content('This account has not yet been activated')
  end
end
