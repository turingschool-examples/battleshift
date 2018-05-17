module Api
  module V1
    module Games
      class ShipsController < ApiController
        def create
          game = Game.find(params[:game_id])
          ship = Ship.new(ship_params[:ship_size])

          ship_placer = if request.headers['X-API-Key'] == game.player_1.api_key
            binding.pry
                          ShipPlacer.new(
                            board: game.player_1.board,
                            ship: ship,
                            start_space: ship_params[:start_space],
                            end_space: ship_params[:end_space]
                          ).run
                          game.save
                        else
                          ShipPlacer.new(
                            board: game.player_2.board,
                            ship: ship,
                            start_space: ship_params[:start_space],
                            end_space: ship_params[:end_space]
                          ).run
                          game.save
                        end
          # binding.pry
          render json: game, message: ship_placer
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
