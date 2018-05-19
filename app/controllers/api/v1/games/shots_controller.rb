module Api
  module V1
    module Games
      class ShotsController < ApiController
        before_action :find_game, only: [:create]

        def create
          return render_401 unless user
          return render_400("Invalid move. It's your opponent's turn") if @game.invalid_turn?(api_key) 
          return render_400('Invalid move. Game over.') unless @game.in_progress?
          return render_400(turn_processor.message) unless turn_processor.run! == true
          render json: @game, message: turn_processor.message
        end

        private

        def user 
          User.find_by_api_key(api_key)
        end

        def turn_processor
          @turn_processor ||= TurnProcessor.new(@game, params[:shot][:target])
        end

        def render_401
          render json: @game, message: "Unauthorized", status: 401
        end

        def render_400(message)
          render json: @game, message: message, status: 400
        end

      end
    end
  end
end
