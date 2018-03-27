require "rails_helper"

describe "user can create game" do
  context "registered user" do
    it "can create game against another player" do
      user = create(:user, status: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit dashboard_path
      click_on "New Game"

      expect(current_path).to eq("/games/new")

      select "Easy", from: "Difficulty"
      fill_in "Opponent email", with: "test@email.com"
      click_on "Invite your Opponent"

      expect(current_path).to eq("/games/1")
      expect(page).to have_content("Place your ships")
      expect(page).to have_link("Finished turn")
    end


  end
end
