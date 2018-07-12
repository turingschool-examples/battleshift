module Api
  module V1
    module Games
      class ShotsController < ApiController
        def create
          key = request.env["HTTP_X_API_KEY"]
          user = User.find_by(api_key: key)
          game = Game.find(params[:game_id])
          if game.player_2 == user
            board = game.player_1_board
          elsif game.player_1 == user
            board = game.player_2_board
          else
            render json: {"message" => "Bad request"}, status: 400
          end
          # binding.pry
          turn_processor = TurnProcessor.new(game, board, params[:target])

          turn_processor.run!
          game.set_message(turn_processor.message)
          render json: game
        end
      end
    end
  end
end

# if request.env["HTTP_X_API_KEY"] && game.current_turn == "player 2"
#   board = game.player_1_board
#   game.current_turn = "challenger"
# else
#   board = game.player_2_board
#   game.current_turn = "player 2"
# end
