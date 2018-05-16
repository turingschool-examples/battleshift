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
        player_1 = User.find_by(api_key: request.env["HTTP_X_API_KEY"])
        email = JSON.parse(request.body.read)["email"]
        player_2 = User.find_by(email: email)

        player_1_board = Board.new(4)
        player_2_board = Board.new(4)
        game = Game.create(player_1_id: player_1.id, player_2_id: player_2.id, player_1_board: player_1_board, player_2_board: player_2_board)
        binding.pry
        render json: game
      end

    end
  end
end
