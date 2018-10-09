require 'rails_helper'

feature 'guest visits user index page' do
  scenario 'sees all users' do

    visit '/users'

    expect(page).to have_css(".user", count: 2)
    within(first(".user")) do
      expect(page).to have_css(".name")
      expect(page).to have_css(".email")
    end
  end
end
