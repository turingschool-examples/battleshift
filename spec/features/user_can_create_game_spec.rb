require "rails_helper"

describe "user can create game" do
  context "registered user" do
    it "can create game against another player" do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit dashboard_path
      click_on "New Game"

      expect(current_path).to be("/games/new")

      fill_in "Board size", with: 4
      fill_in "Opponent email", with: "test@email.com"
      click_on "Create Game"

      expect(current_path).to eq("/games/1")
      expect(page).to have_content("Place your ships")
      expect(page).to have_link("Finished turn")
    end


  end
end
