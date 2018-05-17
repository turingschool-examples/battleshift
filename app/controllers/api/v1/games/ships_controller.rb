module Api
  module V1
    module Games
      class ShipsController < ActionController::API
        def index 
          game = Game.find_by_id(params[:game_id])
          if game.turn_sum.even?
            if game.player_2_board.player.nil?
              game.player_2_board.player(User.find_by_api_key(request.headers['X-API-key']))
            end
          else
            if game.player_1_board.player.nil?
              game.player_1_board.player(User.find_by_api_key(request.headers['X-API-key']))
            end
          end
          render json: game, params: {message: "Successfully placed ship with a size of #{params[:ship_size]}. You have #{} ship(s) to place with a size of #{}." } 
        end
      end
    end
  end
end
