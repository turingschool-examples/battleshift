FactoryBot.define do
  factory :game do
    p1_board = Board.new(4)
    sm_ship = Ship.new(2)
    md_ship = Ship.new(3)

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

    player_1_board p1_board
    player_2_board Board.new(4)
    winner nil
    player_1_turns 0
    player_2_turns 0
    player_1_auth_token "ouhasdio"
    player_2_auth_token "98has98hasd"
    current_turn "player_1"
  end
end
