require 'rails_helper'

describe TurnProcessor do
  before :all do
    user1 = create(:user)
    user2 = create(:user)
    player_1_board = Board.new(2)
    player_2_board = Board.new(2)
    player_1 = Player.new(player_1_board, user1.api_key)
    player_2 = Player.new(player_2_board, user2.api_key)
    @game = Game.create(player_1: player_1,
                        player_2: player_2,
                        player_1_board: player_1_board,
                        player_2_board: player_2_board)
    ship1 = Ship.new(2)
    ship2 = Ship.new(2)
    ShipPlacer.new(board: @game.player_1.board,
                   ship: ship1,
                   start_space: 'A1',
                   end_space: 'A2').run
    ShipPlacer.new(board: @game.player_2.board,
                   ship: ship2,
                   start_space: 'A2',
                   end_space: 'B2').run
    @game.save
  end
  it 'initializes' do
    turn_proc = TurnProcessor.new(@game, 'A1', @game.player_1, @game.player_2)
    expect(turn_proc).to be_instance_of(TurnProcessor)
  end
  describe '#run!' do
    it 'valid attack' do
      turn_proc = TurnProcessor.new(@game, 'A1', @game.player_1, @game.player_2).run!
      expect(turn_proc).to be_truthy
    end
    it 'invalid attack' do
      turn_proc = TurnProcessor.new(@game, 'C1', @game.player_1, @game.player_2).run!
      expect(turn_proc).to include('Invalid coordinates.')
    end
  end
  it '#message' do
    turn_proc = TurnProcessor.new(@game, 'C1', @game.player_1, @game.player_2)

    result = turn_proc.message
    expect(result).to eq('')
  end
  describe '#valid_coordinate?' do
    it 'is valid' do
      turn_proc = TurnProcessor.new(@game, 'A1', @game.player_1, @game.player_2)
      shot = turn_proc.valid_coordinate?
      expect(shot).to be_truthy
    end
    it 'is invalid coord' do
      turn_proc = TurnProcessor.new(@game, 'C1', @game.player_1, @game.player_2)
      shot = turn_proc.valid_coordinate?
      expect(shot).to be_falsey
    end
    it 'is blank coord' do
      turn_proc = TurnProcessor.new(@game, '', @game.player_1, @game.player_2)
      shot = turn_proc.valid_coordinate?
      expect(shot).to be_falsey
    end
  end
end
