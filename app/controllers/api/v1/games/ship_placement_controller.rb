class Api::V1::Games::ShipPlacementController < ApiController
  def create
    game = Game.find(params[:game_id])
    user = User.find_by(user_token: request.env["HTTP_X_API_KEY"])

    if user.id == game.player_1_id
      board = game.player_1_board
    else
      board = game.player_2_board
    end

    ship = Ship.new(params["ship_size"])
    ship_placer = ShipPlacer.new(board, ship, params[:start_space], params[:end_space])
    ship_placer.run
    
    game.save!

    if params["ship_size"] == 3
      render json: game, message: "Successfully placed ship with a size of 3. You have 1 ship(s) to place with a size of 2."
    else
      render json: game, message: "Successfully placed ship with a size of 2. You have 0 ship(s) to place."
    end
  end
end
