module Api
  module V1
    class GamesController < ActionController::API
      def show
        begin
          game = Game.find(params[:id])
          render json: game
        rescue ActiveRecord::RecordNotFound
          render nothing: true, status: 400
        end
      end
    end
  end
end
