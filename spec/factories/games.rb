FactoryBot.define do
  factory :game do
    player_1 create(:user)
    player_2 create(:user)
    player_1_board Board.new(4)
    player_2_board Board.new(4)
  end
end
