module Api
  module V1
    class GamesController < ActionController::API
      def show
        game = Game.find(params[:id])
        render json: game
      end

      def create
        player_1_board = Board.new(4)
        player_2_board = Board.new(4)
        game_attributes = {
          player_1_board: player_1_board,
          player_2_board: player_2_board,
          player_1_turns: 0,
          player_2_turns: 0,
          current_turn: "player_one"
        }
        @game = Game.new(game_attributes)

        if @game.save
          render json: "{\"id\": #{@game.id}}"
        end
      end
    end
  end
end
