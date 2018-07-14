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
