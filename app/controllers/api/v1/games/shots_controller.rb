module Api
  module V1
    module Games
      class ShotsController < ApiController
        before_action :validate_turn, only: :create

        def create
          game = Game.find(params[:game_id])
          turn_processor = TurnProcessor.new(game, params[:shot][:target], opponent_board)

          turn_processor.run!
          if turn_processor.message == "Invalid coordinates."
            render json: game, message: turn_processor.message, status: 400
          else
            binding.pry
            render json: game, message: turn_processor.message
          end
        end


        def validate_turn
          render json: current_game,
            message: "Invalid move. It's your opponent's turn.",
            status: 400 and return false if current_turn != current_player
        end
      end
    end
  end
end
