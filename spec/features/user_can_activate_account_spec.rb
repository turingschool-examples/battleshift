require 'rails_helper'

describe 'A registered user' do
  it 'can activate their account' do

    user = create(:user, status: 'inactive')

    visit(activate_path(user))
    expect(page).to have_content("Thank you! Your account is now activated.")

    visit dashboard_path
    expect(page).to have_content("Status: Active")
  end
end
