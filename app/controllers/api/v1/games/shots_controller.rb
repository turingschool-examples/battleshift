module Api
  module V1
    module Games
      class ShotsController < ApplicationController
        def create
          if game = Game.find(params[:game_id])
            if game.opponent_key != 'computer'

              turn_processor = TurnProcessor.new(game, params[:shot][:target])

              turn_processor.two_player_run!
              render json: game, message: turn_processor.message
            else
              turn_processor = TurnProcessor.new(game, params[:shot][:target])

              turn_processor.run!
              render json: game, message: turn_processor.message
            end
          end
        end
      end
    end
  end
end
