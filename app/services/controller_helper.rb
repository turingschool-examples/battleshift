# Controller Helper provides encapsulated, reusable methods place a ship or fire a shot on the appropriate board, or return an invalid message given a game id and a user api key from the controller
class ControllerHelper
  attr_reader :valid

  def initialize(key, game_id)
    @user = User.find_by(api_key: key)
    @game = Game.find(game_id)
    if @user != @game.player_1 && @user != @game.player_2
      @valid = false
    else
      @valid = true
    end
  end

  def place_ship(params)
    return {"message" => "Bad request"} unless valid
    my_board = true
    ship = Ship.new(params[:ship_size])
    board = find_board(my_board)
    ShipPlacer.new(
      board: board,
      ship: ship,
      start_space: params[:start_space],
      end_space: params[:end_space]
    ).run
    @game.set_message("Successfully placed ship with a size of #{ship.length}. You have #{board.left_to_place} ship(s) to place#{board.length_of_remaining_ship}.")
    @game.save
    @game
  end

  def fire_shot(params)
    return {"message" => "Bad request"} unless valid
    my_board = false
    board = find_board(my_board)
  end

  private

  def find_board(my_board)
    # Returns the appropriate board for ship placement or firing at for a specific user
    if (@user == @game.player_1) == my_board
      return @game.player_1_board
    else
      return @game.player_2_board
    end
  end
end
