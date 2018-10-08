require 'rails_helper'

feature 'guest visits user show page' do
  scenario 'see users information' do

    visit "/users/1"

    expect(page).to have_css(".name")
    expect(page).to have_css(".email")
  end
end
