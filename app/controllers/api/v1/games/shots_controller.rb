module Api
  module V1
    module Games
      class ShotsController < ApiController
        def create
          game = Game.find(params[:game_id])
          # player = game.send(game.current_turn)
          # binding.pry
          # opponent = game.send(game.send(current_turn!))
          if game.current_turn.last.to_i.odd?
            player = game.player_1
            opponent = game.player_2
          else
            player = game.player_2
            opponent = game.player_1
          end
          # binding.pry

          turn_processor = TurnProcessor.new(game, params[:shot][:target], player, opponent)

          turn_processor.run!
          render json: game, message: turn_processor.message
        end
      end
    end
  end
end
