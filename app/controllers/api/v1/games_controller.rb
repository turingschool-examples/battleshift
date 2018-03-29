module Api
  module V1
    class GamesController < ActionController::API
      def show
        if Game.exists?(id: params[:id])
          game = Game.find(params[:id])
          render json: game
        else
          render :status => 400
        end
      end

      def index
      end

      def create
        game = Game.create(player_1_board: Board.new(4),
                           player_2_board: Board.new(4))
        render json: game
      end
    end
  end
end
# response.request.env["HTTP_X_API_KEY"]
