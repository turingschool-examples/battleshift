class Api::V1::Games::ShipsController < ApiController
  def create
    key = request.env["HTTP_X_API_KEY"]
    user = User.find_by(api_key: key)
    game = Game.find(params[:game_id])
    if game.player_1 == user
      board = game.player_1_board
    elsif game.player_2 == user
      board = game.player_2_board
    else
      render json: {"message" => "Bad request"}, status: 400
    end

    ship = Ship.new(params[:ship_size].to_i)

    ShipPlacer.new(
      board: board,
      ship: ship,
      start_space: params[:start_space],
      end_space: params[:end_space]
    ).run
    game.save
    game.set_message("Successfully placed ship with a size of #{ship.length}. You have #{board.left_to_place} ship(s) to place#{board.length_of_remaining_ship}.")
  
    render json: game
    
  end

end
