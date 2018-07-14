require 'rails_helper'

context "User 1 and User 2 are already playing a game" do
    it "does not allow them to begin a new game" do
        user_1 = create(:user)
        user_2 = create(:user2)

        game_1 = Game.create(player_1_board: Board.new(4),
                             player_2_board: Board.new(4),
                             player_1_turns: 0,
                             player_2_turns: 0,
                             current_turn: "player 1",
                             player_1_id: user_1.id,
                             player_2_id: user_2.id
        )
        
        game_2 = Game.create(player_1_board: Board.new(4),
                             player_2_board: Board.new(4),
                             player_1_turns: 0,
                             player_2_turns: 0,
                             current_turn: "player 1",
                             player_1_id: user_1.id,
                             player_2_id: user_2.id)
        # binding.pry
    end
end