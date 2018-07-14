FactoryBot.define do
  factory :game do
    player_1 create(:user)

    player_1_board Board.new(4)
    player_2_board Board.new(4)
    winner nil
    player_1_turns 0
    player_2_turns 0
    current_turn "player 1"
  end
end
