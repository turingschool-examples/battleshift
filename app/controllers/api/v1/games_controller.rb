module Api
  module V1
    class GamesController < ActionController::API
      def show
        game = Game.find_by_id(params[:id])
        if game
          render json: game
        else
          render json: not_found, status: 400  
        end
      end


      private

        def not_found
          { status: 400,
            message: 'Game does not exist' }.to_json
        end
    end
  end
end
