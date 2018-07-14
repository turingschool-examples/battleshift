class Api::V1::Games::ShipsController < ApiController
  def create
    key = request.env["HTTP_X_API_KEY"]
    game_id = params[:game_id]
    ch = ControllerHelper.new(key, game_id)
    game = ch.place_ship(ship_params)
    # binding.pry
    # sp = ShipPlacer.new(key, game_id, ship_params)
    # game = sp.run
    # render json: game
    #
    # user = User.find_by(api_key: key)
    # game = Game.find(params[:game_id])
    # if game.player_1 == user
    #   board = game.player_1_board
    # elsif game.player_2 == user
    #   board = game.player_2_board
    # else
    #   render json: {"message" => "Bad request"}, status: 400
    # end
    #
    # ship = Ship.new(params[:ship_size].to_i)
    #
    # ShipPlacer.new(
    #   board: board,
    #   ship: ship,
    #   start_space: params[:start_space],
    #   end_space: params[:end_space]
    # ).run
    # game.save
    # game.set_message("Successfully placed ship with a size of #{ship.length}. You have #{board.left_to_place} ship(s) to place#{board.length_of_remaining_ship}.")

    render json: game
  end

  private

  def ship_params
    {
      ship_size: params[:ship_size].to_i,
      start_space: params[:start_space],
      end_space: params[:end_space]
    }
  end
end
