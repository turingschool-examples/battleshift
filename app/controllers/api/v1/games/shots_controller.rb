module Api
  module V1
    module Games
      class ShotsController < ApiController
        before_action :set_player, :validate_all


        def create
          turn_processor

          turn_processor.run!
          render json: current_game, message: turn_processor.message
        end

        private

        def turn_processor
          @turn_processor ||= TurnProcessor.new(current_game, params[:shot][:target], @player, @opponent)
        end

        def set_player
          if current_game.current_turn.last.to_i.odd?
            @player = current_game.player_1
            @opponent = current_game.player_2
          else
            @player = current_game.player_2
            @opponent = current_game.player_1
          end
        end

        def validate_all
          return render status: 401, json: current_game, message: 'Unauthorized' unless authorized_users?
          render status: 400, json: current_game, message: 'Invalid move. Game over.' if current_game.game_over?
          render status: 400, json: current_game, message: "Invalid coordinates." if !turn_processor.valid_coordinate?
          render status: 400, json: current_game, message: "Invalid move. It's your opponent's turn" unless current_player?
        end
      end
    end
  end
end
