FactoryBot.define do
  factory :game do
    player_1_board Board.new(4)
    player_2_board Board.new(4)
    winner nil
    player_1_turns 0
    player_2_turns 0
    player_1_auth_token "ouhasdio"
    player_2_auth_token "98has98hasd"
    current_turn "player_1"
  end
end
