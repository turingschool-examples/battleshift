module Api
  module V1
    class GamesController < ActionController::API
      def show
        if game = Game.find(params[:id])
          render json: game
        else
          render json: { status: 400, message: "No game found" }
        end
      end
    end
  end
end
