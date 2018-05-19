module Api
  module V1
    module Games
      class ShotsController < ApiController
        before_action :find_game, only: [:create]
        before_action :validate,  only: [:create]

        def create
          render json: @game, message: processor.message
        end

        private

        def validate
          return render_401 unless user
          return render_400 if @game.invalid_turn?(api_key)
          return render_400('Invalid move. Game over.') unless @game.in_progress?
          return render_400(processor.message) unless processor.run! == true
        end

        def user 
          User.find_by_api_key(api_key)
        end

        def processor
          @processor ||= TurnProcessor.new(@game, params[:shot][:target])
        end

        def render_401
          render json: @game, message: "Unauthorized", status: 401
        end

        def render_400(message = "Invalid move. It's your opponent's turn")
          render json: @game, message: message, status: 400
        end
      end
    end
  end
end
