require 'rails_helper'

describe TurnProcessor do
  before :all do
    user1 = create(:user)
    user2 = create(:user)
    player_1_board = Board.new(2)
    player_2_board = Board.new(2)
    player_1 = Player.new(player_1_board, user1.api_key)
    player_2 = Player.new(player_2_board, user2.api_key)
    game = Game.create(player_1: player_1,
                       player_2: player_2,
                       player_1_board: player_1_board,
                       player_2_board: player_2_board)
    ship1 = Ship.new(2)
    
    @turn_proc = TurnProcessor.new(game, 'A1', game.player_1, @game.player_2)
  end
  it 'initializes' do
    expect(turn_proc).to be_instance_of(TurnProcessor)
  end
  it '#run!' do

  end
end
