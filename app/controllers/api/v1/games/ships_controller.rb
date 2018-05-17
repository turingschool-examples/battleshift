module Api
  module V1
    module Games
      class ShipsController < ActionController::API
        def index
          game = Game.find_by_id(params[:game_id])
          binding.pry
          if game.turn_sum.even?
            if game.player_2_board.player.nil?
              game.player_2_board.player(User.find_by_api_key(request.headers['X-API-key']))
              #board = game.player_2_board
            end
          else
            if game.player_1_board.player.nil?
              game.player_1_board.player(User.find_by_api_key(request.headers['X-API-key']))
              #board = game.player_1_board
            end
          end

          ship_placer = ShipPlacer.new(board: board, ship: Ship.new(params['ship_size']), start_space: params['start_space'], end_space: params['end_space'])
          message = ship_placer.message #call the message from the ShipPlacer
          render json: game, message: message
        end
      end
    end
  end
end
