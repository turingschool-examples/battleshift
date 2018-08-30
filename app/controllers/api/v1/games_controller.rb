class Api::V1::GamesController < ActionController::API
  def show
    game = Game.find(params[:id])
    render json: game
  end

  def create
    player_1 = User.find_by(user_token: request.env["HTTP_X_API_KEY"])
    player_2 = User.find_by(email: params[:opponent_email])
    player_1_board = Board.new(4)
    player_2_board = Board.new(4)
    game = Game.create!(player_1_token: player_1.user_token, 
                        player_2_token: player_2.user_token,
                        player_1_board: player_1_board,
                        player_2_board: player_2_board)
      # require 'pry'; binding.pry
    render json: game
  end
end

