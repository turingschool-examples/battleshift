module Api
  module V1
    module Games
      class ShotsController < ApiController
        before_action :require_correct_player
        # before_action :require_correct_coordinate

        def create
          if current_game.current_turn.last.to_i.odd?
            player = current_game.player_1
            opponent = current_game.player_2
          else
            player = current_game.player_2
            opponent = current_game.player_1
          end

          turn_processor = TurnProcessor.new(current_game, params[:shot][:target], player, opponent)

          if current_game.game_over?
            render status: 400, json: current_game, message: 'Invalid move. Game over.'
          elsif turn_processor.valid_coordinate?
            turn_processor.run!
            render json: current_game, message: turn_processor.message
          else
            incorrect_coordinate
          end
        end

        def require_correct_player
          render status: 400, json: current_game, message: "Invalid move. It's your opponent's turn" unless current_player?
        end

        def incorrect_coordinate
          render status: 400, json: current_game, message: "Invalid coordinates."
        end
      end
    end
  end
end
