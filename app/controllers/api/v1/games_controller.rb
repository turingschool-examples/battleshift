module Api
  module V1
    class GamesController < ApiController 
      before_action :find_game, only: [:create]
      
      def show
        render_400('Game does not exist') unless game
        render_game
      end

      def create
        render json: Game.create_default(params, request.headers)
      end

      private

      def render_game
        render json: game
      end
    end
  end
end
