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
        player_1_token = request.env["HTTP_X_API_KEY"]
        binding.pry

        if User.find_by(api_key: player_1_token) != nil
          player_1 = Player.new(Board.new, )
          player_1_board = Board.new(4)
          player_2_board = Board.new(4)
          game = Game.create(player_1_board: player_1_board, player_2_board: player_2_board)

          render json: game
        end
      end

    end
  end
end
