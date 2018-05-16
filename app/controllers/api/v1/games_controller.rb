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

      def create
        player_1_key = request.headers['X-API-KEY']
        player_2_key = User.find_by(email: params['opponent_email']).api_key
        player_1 = Player.new(Board.new(4), player_1_key)
        player_2 = Player.new(Board.new(4), player_2_key)

        game = Game.create(player_1: player_1,
                           player_2: player_2)
        render json: game
      end
    end
  end
end
