module Api
  module V1
    module Games
      class ShipsController < ApiController
        def create
          ship = Ship.new(ship_params[:ship_size])
          ship_placer = ShipPlacer.new({ board: current_player.board,
                                         ship: ship,
                                         start_space: ship_params[:start_space],
                                         end_space: ship_params[:end_space] }).run
          current_game.save
          render json: current_game, message: ship_placer
        end

        private

        def ship_params
          params.require(:ship).permit(:ship_size,
                                       :start_space,
                                       :end_space,
                                       :password_confirmation)
        end
      end
    end
  end
end
