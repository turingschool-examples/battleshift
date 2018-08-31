player_1_board = Board.new(4)
player_2_board = Board.new(4)

player_1 = User.create(email: "brickstar@gmail.com", name: 'matt', password: '123', status: 'active', user_token: ENV['BATTLESHIFT_API_KEY'])
player_2 = User.create(email: "jtr022@gmail.com", name: 'john', password: '123', status: 'active', user_token: ENV['BATTLESHIFT_OPPONENT_API_KEY'])

sm_ship = Ship.new(2)
md_ship = Ship.new(3)

# Place Player 1 ships
ShipPlacer.new( player_1_board,
                sm_ship,
               "A1",
               "A2").run

ShipPlacer.new( player_1_board,
                md_ship,
               "B1",
               "D1").run

# Place Player 2 ships
ShipPlacer.new( player_2_board,
                sm_ship.dup,
               "A1",
               "A2").run

ShipPlacer.new( player_2_board,
                md_ship.dup,
               "B1",
               "D1").run

game_attributes = {
  player_1_board: player_1_board,
  player_2_board: player_2_board,
  player_1_turns: 0,
  player_2_turns: 0,
  current_turn: 0,
  player_1_id: player_1.id,
  player_2_id: player_2.id
}

game = Game.new(game_attributes)
game.save!
