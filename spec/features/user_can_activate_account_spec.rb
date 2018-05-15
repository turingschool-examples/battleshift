require 'rails_helper'

describe 'A registered user' do
  it 'can activate their account' do

    user = create(:user, status: 'inactive')

    # expect(email.subject).to include(user.name)
    # expect(email.html_part.body.to_s).to have_content("Visit here to activate your account.")
    #
    # link = email.html_part.body.raw_source.match(/href="(?<url>.+?)">/)[:url]

    visit(activate_path(user))
    expect(page).to have_content("Thank you! Your account is now activated.")

    visit dashboard_path
    expect(page).to have_content("Status: Active")
  end
end
