module Api
  module V1
    module Games
      class ShotsController < ApiController
        def create
          game = Game.find(params[:game_id])
          if bad_user(game)
            render json: game, message: "Invalid move. It's your opponent's turn", status: 400 
          else
            turn_processor = TurnProcessor.new(game, params[:shot][:target])
            turn_processor.run!
            game.save!
            render json: game, message: turn_processor.message
          end
        end

        private

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
