module Api
  module V1
    class GamesController < ActionController::API
      def create
        auth_token = request.headers["HTTP_X_API_KEY"]
        Game.create(

        )
      end


      def show
        # TODO: params[:auth_token] instead?
        if game = Game.find_by_id(params[:id])
          render json: game
        else
          head :bad_request
        end
      end



    end
  end
end
