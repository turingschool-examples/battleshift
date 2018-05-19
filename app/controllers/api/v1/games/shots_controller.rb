module Api
  module V1
    module Games
      class ShotsController < ApiController
        before_action :validate_turn, only: :create

        def create
          game = Game.find(params[:game_id])
          turn_processor = TurnProcessor.new(game, params[:shot][:target], opponent_board)

          turn_processor.run!
          render json: game, message: turn_processor.message
        end

        def validate_turn
          response = { message: "Invalid move. It's your opponent's turn" }.to_json
          render json: response, status: 400 and return false if current_turn != current_user
        end
      end
    end
  end
end
