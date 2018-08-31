FactoryBot.define do
  factory :game do
    user_1 = create(:user)
    user_2 = create(:user, auth_token: "kasvkb495489", email: "fakeymcfake@fake.com")


    p1_board = Board.new(4)
    p2_board = Board.new(4)

    sm_ship = Ship.new(2)
    md_ship = Ship.new(3)

    sm2_ship = Ship.new(2)
    md2_ship = Ship.new(3)

    ShipPlacer.new(
                    board: p1_board,
                    ship: sm_ship,
                    start_space: "A1",
                    end_space: "A2"
                  ).run

    ShipPlacer.new(
                    board: p1_board,
                    ship: md_ship,
                    start_space: "B1",
                    end_space: "D1"
                  ).run

    ShipPlacer.new(
                    board: p2_board,
                    ship: sm2_ship,
                    start_space: "A1",
                    end_space: "A2"
                  ).run

    ShipPlacer.new(
                    board: p2_board,
                    ship: md2_ship,
                    start_space: "B1",
                    end_space: "D1"
                  ).run

    player_1_board p1_board
    player_2_board p2_board
    winner nil
    player_1_turns 0
    player_2_turns 0
    player_1_auth_token user_1.auth_token
    player_2_auth_token user_2.auth_token
    current_turn "player_1"
  end
end
