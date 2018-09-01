class Api::V1::GamesController < ApiController

  def show
    find_valid_game(params[:id])
  end

  def create
    player_1 = User.find_by(user_token: request.env["HTTP_X_API_KEY"])
    player_2 = User.find_by(email: params[:opponent_email])
    player_1_board = Board.new(4)
    player_2_board = Board.new(4)

    game = Game.create!(player_1_id: player_1.id,
                        player_2_id: player_2.id,
                        player_1_board: player_1_board,
                        player_2_board: player_2_board)
    render json: game
  end
end

