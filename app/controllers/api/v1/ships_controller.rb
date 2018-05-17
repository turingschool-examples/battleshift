class Api::V1::ShipsController < ApiController
    def create
      board = ShipPlacer.new(ship_params)
      board.run
      
      render json: current_game
    end

    private
    def ship_params
    {
      board: current_board,
      ship: Ship.new(params["ship_size"]),
      start_space: params["start_space"],
      end_space: params["end_space"]
    }
    end
end
