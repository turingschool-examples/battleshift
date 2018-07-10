module Api
  module V1
    class GamesController < ActionController::API
      def show
        if Game.exists?(params[:id])
          game = Game.find(params[:id])
          render json: game
        else
          render json: {"message" => "Bad request"}, status: 400
        end
      end
    end
  end
end
