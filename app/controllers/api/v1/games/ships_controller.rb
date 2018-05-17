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
          length = params[:ship_size]
          start_space = params[:start_space]
          end_space = params[:end_space]
          ship = Ship.new(length)
          ship.place(start_space, end_space)
  
          ship_placer = ShipPlacer.new(board: board, ship: ship, start_space: params['start_space'], end_space: params['end_space'])
          ship_placer.run
          message = ship_placer.message #call the message from the ShipPlacer
          game.save!
          render json: game, message: message
        end
      end
    end
  end
end
