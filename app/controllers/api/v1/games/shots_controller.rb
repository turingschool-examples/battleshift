module Api
  module V1
    module Games
      class ShotsController < ApiController
        def create
          key = request.env["HTTP_X_API_KEY"]
          game_id = params[:game_id]
          ch = ControllerHelper.new(key, game_id)
          game = ch.fire_shot(params[:target])

          user = User.find_by(api_key: key)
          game = Game.find(params[:game_id])

          if user != game.player_1 && user != game.player_2
            return render json: {"message" => "Unauthorized"}, status: 401
          end

          if game.player_2 == user && game.current_turn == "player 2"
            board = game.player_1_board
            game.current_turn = "player 1"
          elsif game.player_1 == user && game.current_turn == "player 1"
            board = game.player_2_board
            game.current_turn = "player 2"
          else
            game.set_message("Invalid move. It's your opponent's turn")

            return render json: game, status: 400
          end

          if game.winner
            game.set_message("Invalid move. Game over.")
            return render json: game, status: 400
          end

          turn_processor = TurnProcessor.new(game, board, params[:target])

          turn_processor.run!
          message = game.set_message(turn_processor.message)
          if message.include?("Battleship sunk. Game over")
            game.winner = user.id
            game.save
          end
          if message.include?("Invalid coordinates")
            status = 400
          else
            status = 200
          end

          render json: game, status: status
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
