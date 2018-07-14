require 'rails_helper'

context "User 1 and User 2 are already playing a game" do
    it "does not allow them to begin a new game" do
        user_1 = create(:user)
        user_2 = create(:user2)

        # game = create(:game)
        # binding.pry
  end
end