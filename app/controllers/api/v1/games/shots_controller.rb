module Api
  module V1
    module Games
      class ShotsController < ApiController
        before_action :require_correct_player

        def create
          # game = Game.find(params[:game_id])

          if current_game.current_turn.last.to_i.odd?
            player = current_game.player_1
            opponent = current_game.player_2
          else
            player = current_game.player_2
            opponent = current_game.player_1
          end

          turn_processor = TurnProcessor.new(current_game, params[:shot][:target], player, opponent)

          turn_processor.run!
          render json: current_game, message: turn_processor.message
        end

        def require_correct_player
          require 'pry'; binding.pry
          render status: 400, json: current_game, message: "Invalid move. It's your opponent's turn" unless current_player?
        end
      end
    end
  end
end
