require 'rails_helper'

context "User 1 and User 2 are already playing a game" do
    it "does not allow them to begin a new game" do
        user_1 = create(:user)
        user_2 = create(:user2)

        game = Game.create(player_1: user_1
                           player_2: user_2
        )
        binding.pry
  end
end