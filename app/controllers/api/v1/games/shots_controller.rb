module Api
  module V1
    module Games
      class ShotsController < ApiController
        before_action :find_game, only: [:create]

        def create
          return render_401 if User.find_by_api_key(api_key).nil?
          return render_400("Invalid move. It's your opponent's turn") if bad_user(@game)
          return render_400('Invalid move. Game over.') unless @game.winner.nil?
          turn = turn_processor.run!
          @game.save!
          return render_400(turn_processor.message) unless turn == true
          render json: @game, message: turn_processor.message
        end

        private

        def turn_processor
          @turn_processor ||= TurnProcessor.new(@game, params[:shot][:target])
        end

        def render_401
          render json: @game, message: "Unauthorized", status: 401
        end

        def render_400(message)
          render json: @game, message: message, status: 400
        end

        def bad_user(game)
          if game.current_turn == 'computer'
             request.headers['X-API-key'] == game.p2.api_key
          else
            request.headers['X-API-key'] == game.p1.api_key
          end
        end
      end
    end
  end
end
