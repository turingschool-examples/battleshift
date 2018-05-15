module Api
  module V1
    class GamesController < ActionController::API
      def show
        game = Game.find(params[:id])
        render json: game
      end

      def create
        TODO: create first player
        game = Game.new
        render json: game
      end
    end
  end
end
