module Api
  module V1
    class GamesController < ActionController::API
      def create
        key = request.env["HTTP_X_API_KEY"]
        user = User.find_by(api_key: key)
        binding.pry
      end

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
