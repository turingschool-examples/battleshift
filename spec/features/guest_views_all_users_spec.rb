require 'rails_helper'

feature 'guest visits user index page' do
  scenario 'sees all users' do
    file = File.open("./fixtures/all_user_data.json")
    stub_request(:get, "http://localhost:3000/api/v1/users")
      .to_return(body: file, status: 200)

    visit '/users'

    expect(page).to have_css(".user", count: 2)
    within(first(".user")) do
      expect(page).to have_css(".name")
      expect(page).to have_css(".email")
    end
  end
end
