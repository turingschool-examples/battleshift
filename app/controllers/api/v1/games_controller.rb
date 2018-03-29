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
        user_1_api_key = response.request.env["HTTP_X_API_KEY"]
        player_1_lookup = ApiKey.find_by(api_key: user_1_api_key).user
        player_2_lookup = User.find_by(email: params[:opponent_email])
        GamePlayer.create(player_1_id: player_1_lookup.id, player_2_id: player_2_lookup.id, game_id: game.id)
        render json: game
      end
    end
  end
end
