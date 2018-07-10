class Api::V1::Games::ShipsController < ApiController
  def create
    game = Game.find(params[:game_id])
    ship = Ship.new(params[:ship_size])
    # binding.pry
    # board = nil
    # if game.current_turn == "challenger"
    #   board = game.player_1_board
    #   game.current_turn = "chanlengee"
    # else
    #   board = game.player_2_board
    #   game.current_turn = "challenger"
    # end
    ShipPlacer.new(
      board: game.player_1_board,
      ship: ship,
      start_space: params[:start_space],
      end_space: params[:end_space]
    ).run
    # binding.pry
    game.set_message("Successfully placed ship with a size of #{ship.length}. You have 1 ship(s) to place with a size of 2.")
    render json: game
  end

end
