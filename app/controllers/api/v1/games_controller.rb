module Api
  module V1
    class GamesController < ActionController::API
      def index
        render json: Game.all
      end

      def show
        begin
          game = Game.find(params[:id])
          render json: game
        rescue ActiveRecord::RecordNotFound
          render nothing: true, status: 400
        end
      end

      def create
        player_1_key = request.headers['X-API-KEY']
        player_2_key = User.find_by(email: params['opponent_email']).api_key
        require 'pry'; binding.pry
        render json: Game.new()
      end
    end
  end
end
