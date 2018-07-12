module Api
  module V1
    module Games
      class ShotsController < ApiController
        def create
          game = Game.find(params[:game_id])
          if request.env["HTTP_X_API_KEY"]
            board = game.player_2_board
          else
            board = game.player_1_board
          end 
          turn_processor = TurnProcessor.new(game, params[:target])
          
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