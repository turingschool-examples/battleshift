module Api
  module V1
    module Games
      class ShipsController < ActionController::API
        def index
          game = Game.find_by_id(params[:game_id])
          if request.headers['X-API-key'] == game.player_1.api_key
            board = game.player_1_board
          else
            board = game.player_2_board
          end 
          ship_placer = ShipPlacer.new(board: board, ship: Ship.new(params['ship_size']), start_space: params['start_space'], end_space: params['end_space'])
          message = ship_placer.message #call the message from the ShipPlacer
          render json: game, message: message
        end
      end
    end
  end
end
