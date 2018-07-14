# Controller Helper provides encapsulated, reusable methods place a ship or fire a shot on the appropriate board, or return an invalid message given a game id and a user api key from the controller
class ControllerHelper
  attr_reader :valid,
              :status_code

  def initialize(key, game_id)
    @user = User.find_by(api_key: key)
    @game = Game.find(game_id)
    if @user != @game.player_1 && @user != @game.player_2
      @valid = false
    else
      @valid = true
    end
    @status_code = 200
  end

  def place_ship(params)
    return invalid_user unless valid
    my_board = true
    ship = Ship.new(params[:ship_size])
    board = find_board(my_board)
    ShipPlacer.new(
      board: board,
      ship: ship,
      start_space: params[:start_space],
      end_space: params[:end_space]
    ).run
    game.set_message("Successfully placed ship with a size of #{ship.length}. You have #{board.left_to_place} ship(s) to place#{board.length_of_remaining_ship}.")
    game.save
    game
  end

  def fire_shot(target)
    return invalid_user("Unauthorized", 401) unless valid
    return invalid_game("Invalid move. It's your opponent's turn", 400) unless right_turn
    return invalid_game("Invalid move. Game over.", 400) if game.winner
    my_board = false
    board = find_board(my_board)
    tp = TurnProcessor.new(game, board, target)
    tp.run!
    message = game.set_message(tp.message)
    finalize_turn(message)
    game
  end

  # if user != game.player_1 && user != game.player_2
  #   return render json: {"message" => "Unauthorized"}, status: 401
  # end
  #
  # if game.player_2 == user && game.current_turn == "player 2"
  #   board = game.player_1_board
  #   game.current_turn = "player 1"
  # elsif game.player_1 == user && game.current_turn == "player 1"
  #   board = game.player_2_board
  #   game.current_turn = "player 2"
  # else
  #   game.set_message("Invalid move. It's your opponent's turn")
  #
  #   return render json: game, status: 400
  # end
  #
  # if game.winner
  #   game.set_message("Invalid move. Game over.")
  #   return render json: game, status: 400
  # end
  #
  # turn_processor = TurnProcessor.new(game, board, params[:target])
  #
  # turn_processor.run!
  # message = game.set_message(turn_processor.message)
  # if message.include?("Battleship sunk. Game over")
  #   game.winner = user.id
  #   game.save
  # end
  # if message.include?("Invalid coordinates")
  #   status = 400
  # else
  #   status = 200
  # end
  #
  # render json: game, status: status
  private
  attr_reader :game,
              :user

  def find_board(my_board)
    # Returns the appropriate board for ship placement or firing at for a specific user
    if (user == game.player_1) == my_board
      return game.player_1_board
    else
      return game.player_2_board
    end
  end

  def invalid_user(message = "Bad request", code = 400)
    @status_code = code
    {"message" => message}
  end

  def right_turn
    # returns bool if it is the user's turn
    (game.player_2 == user && game.current_turn == "player 2") || (game.player_1 == user && game.current_turn == "player 1")
  end

  def invalid_game(message, code)
    game.set_message(message)
    @status_code = code
    game
  end

  def finalize_turn(message)
    evaluate_message(message)
    set_player_turn if @status_code == 200
    game.save
  end

  def set_player_turn
    if game.current_turn == "player 1"
      game.current_turn = "player 2"
    else
      game.current_turn = "player 1"
    end
  end

  def evaluate_message(message)
    if message.include?("Battleship sunk. Game over")
      game.winner = user.id
    end
    if message.include?("Invalid coordinates")
      @status_code = 400
    else
      @status_code = 200
    end
  end
end
