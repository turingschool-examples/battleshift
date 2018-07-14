FactoryBot.define do
  factory :user do
    email "bob@bob.bob"
    name "bob"
    password "1234"
    api_key "abcd"

    factory :user2 do
      email "blob@blob.blob"
      name "blob"
      password "4321"
      api_key "wxyz"
    end
  end
  factory :game do
    player_1 :user

    player_1_board Board.new(4)
    player_2_board Board.new(4)
    winner nil
    player_1_turns 0
    player_2_turns 0
    current_turn "player 1"
  end
end
