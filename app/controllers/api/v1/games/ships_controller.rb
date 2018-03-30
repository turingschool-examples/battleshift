module Api
  module V1
    module Games
      class ShipsController < ApiController
        def create
          game = Game.find(params[:id])

          shipplacer = ShipPlacer.new(
                board: game.player_1_board,
                ship: Ship.new(params[:ship]["ship_size"]),
                start_space: params[:ship]["start_space"],
                end_space: params[:ship]["end_space"])
          shipplacer.run

          render json: game, message: shipplacer.messages
        end
      end
    end
  end
end
