module Api
  module V1
    module Games
      class ShipsController < ApiController
        def create
          game = Game.find(params[:id])

          # game.player_1_board.set_space_occupied()
          shipplacer = ShipPlacer.new(board: game.player_1_board,
                          ship: Ship.new(params[:ship]["ship_size"]),
                          start_space: params[:ship]["start_space"],
                          end_space: params[:ship]["end_space"]).run


          render json: game
        end
      end
    end
  end
end
