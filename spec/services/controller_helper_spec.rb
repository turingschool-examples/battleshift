require 'rails_helper'

describe 'creating helper' do
  it 'returns a valid helper' do
    user1 = create(:user)
    user2 = create(:user2)
    b1 = Board.new(4)
    b2 = Board.new(4)
    attributes = {
      player_1: user1,
      player_2: user2,
      player_1_board: b1,
      player_2_board: b2,
      player_1_turns: 0,
      player_2_turns: 0,
      current_turn: "player 1"
    }
    game = Game.create(attributes)

    ch = ControllerHelper.new(user1.api_key, game.id)

    expect(ch).to be_a(ControllerHelper)
    expect(ch.valid).to eq(true)
  end

  it 'returns false validation if invalid' do
    user1 = create(:user)
    user2 = create(:user2)
    user3 = User.create(email: 'other@bob.bob', name: 'other', password: '1928', api_key: '5647')
    b1 = Board.new(4)
    b2 = Board.new(4)
    attributes = {
      player_1: user1,
      player_2: user2,
      player_1_board: b1,
      player_2_board: b2,
      player_1_turns: 0,
      player_2_turns: 0,
      current_turn: "player 1"
    }
    game = Game.create(attributes)

    ch = ControllerHelper.new(user3.api_key, game.id)

    expect(ch).to be_a(ControllerHelper)
    expect(ch.valid).to eq(false)
  end
end

describe 'ship placement' do
  it 'returns bad message if invalid' do
    user1 = create(:user)
    user2 = create(:user2)
    user3 = User.create(email: 'other@bob.bob', name: 'other', password: '1928', api_key: '5647')
    b1 = Board.new(4)
    b2 = Board.new(4)
    attributes = {
      player_1: user1,
      player_2: user2,
      player_1_board: b1,
      player_2_board: b2,
      player_1_turns: 0,
      player_2_turns: 0,
      current_turn: "player 1"
    }
    game = Game.create(attributes)

    ch = ControllerHelper.new(user3.api_key, game.id)
    game = ch.place_ship({})

    expect(game).to eq({"message" => "Bad request"})
  end

  it 'places ship on valid board' do
    user1 = create(:user)
    user2 = create(:user2)

    b1 = Board.new(4)
    b2 = Board.new(4)
    attributes = {
      player_1: user1,
      player_2: user2,
      player_1_board: b1,
      player_2_board: b2,
      player_1_turns: 0,
      player_2_turns: 0,
      current_turn: "player 1"
    }
    game = Game.create(attributes)

    ch = ControllerHelper.new(user1.api_key, game.id)
    game = ch.place_ship({ship_size: 2, start_space: "A1", end_space: "A2"})

    expect(game).to be_a(Game)
    expect(game.player_1_board.ships.count).to eq(1)
    expect(game.player_2_board.ships.count).to eq(0)
    expect(game.message).to eq("Successfully placed ship with a size of 2. You have 1 ship(s) to place with a size of 3.")
  end
end

describe 'fire shot' do
  it 'returns bad message if invalid' do
    user1 = create(:user)
    user2 = create(:user2)
    user3 = User.create(email: 'other@bob.bob', name: 'other', password: '1928', api_key: '5647')
    b1 = Board.new(4)
    b2 = Board.new(4)
    attributes = {
      player_1: user1,
      player_2: user2,
      player_1_board: b1,
      player_2_board: b2,
      player_1_turns: 0,
      player_2_turns: 0,
      current_turn: "player 1"
    }
    game = Game.create(attributes)

    ch = ControllerHelper.new(user3.api_key, game.id)
    game = ch.fire_shot({})

    expect(game).to eq({"message" => "Unauthorized"})
    expect(ch.status_code).to eq(401)
  end

  it 'fires shot on valid board' do
    user1 = create(:user)
    user2 = create(:user2)

    b1 = Board.new(4)
    b2 = Board.new(4)
    attributes = {
      player_1: user1,
      player_2: user2,
      player_1_board: b1,
      player_2_board: b2,
      player_1_turns: 0,
      player_2_turns: 0,
      current_turn: "player 1"
    }
    game = Game.create(attributes)
    b1 = game.player_1_board
    b2 = game.player_2_board
  
    sm_ship = Ship.new(2)
    md_ship = Ship.new(3)
    ShipPlacer.new(board: b1,
      ship: sm_ship,
      start_space: "A1",
      end_space: "A2").run


    ShipPlacer.new(board: b2,
      ship: sm_ship,
      start_space: "A1",
      end_space: "A2").run

    ShipPlacer.new(board: b1,
      ship: md_ship,
      start_space: "B1",
      end_space: "B3").run

    ShipPlacer.new(board: b2,
      ship: md_ship,
      start_space: "B1",
      end_space: "B3").run

    game.save

    ch = ControllerHelper.new(user1.api_key, game.id)
    game = ch.fire_shot("C1")

    expect(game).to be_a(Game)
    expect(game.message).to eq("Your shot resulted in a Miss.")
  end
end
