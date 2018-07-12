class Api::V1::Games::ShipsController < ApiController
  def create
    game = Game.find(params[:game_id])
    ship = Ship.new(params[:ship_size].to_i)
    if request.env["HTTP_X_API_KEY"]
      board = game.player_2_board
    else
      # binding.pry
      board = game.player_1_board
    end
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
