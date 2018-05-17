class Api::V1::ShipsController < ApiController
    def create
      ship_placer = ShipPlacer.new(ship_params)
      ship_placer.run
      current_game.save!

      render json: current_game, message: ship_placer.message
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
