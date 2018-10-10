require 'rails_helper'

feature 'guest visits user show page' do
  scenario 'see users information' do
    file = File.open("./fixtures/single_user_data.json")
    stub_request(:get, "http://localhost:3000/api/v1/users/1")
      .to_return(body: file, status: 200)

    visit "/users/1"

    expect(page).to have_css(".name")
    expect(page).to have_css(".email")
  end
end
