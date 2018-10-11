require 'rails_helper'

feature 'visitor can edit email' do
  scenario 'edits email' do
# When I visit "/users"
VCR.use_cassette("visitor_can_edit_email#index") do
  visit "/users"
end

# And I click on `Edit` for Josiah Bartlet
  within "#user-1" do
    VCR.use_cassette("visitor_click_on_edit") do
      click_on "Edit"
    end
  end

  # Then I should be on "/users/1/edit"
  expect(current_path).to eq("/users/1/edit")

  # When I fill in the email field with "josiah@example.com"
  fill_in :Email, with: "josiah@example.com"

  # And I click "Save"
  VCR.use_cassette("visitor_click_on_save") do
    click_on "Save"
  end
  # Then I should be on "/users"
  expect(current_path).to eq("/users")
  # And I should see a flash message that says "Successfully updated Josiah Bartlet."
  expect(page).to have_content("josiah@example.com")
  expect(page).to have_content("Successfully updated Josiah Bartlet.")

  # And I should should see Josiah Bartlet's email show up in the list as "josiah@example.com"


  end
end
