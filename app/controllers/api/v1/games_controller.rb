class Api::V1::GamesController < ActionController::API
  def show
    game = Game.find_by_id(params[:id])
    if game
      render json: game
    else
      render status: 400
    end
  end

  def create
    if User.find_by(api_token: request.headers['X-API-Key'])

      game_attributes = {
        player_1_board: Board.new(4),
        player_2_board: Board.new(4),
        player_1_turns: 0,
        player_2_turns: 0,
        current_turn: 0,
        player_key: User.find_by(api_token: request.headers['X-API-Key']).api_token,
        opponent_key: User.find_by(email: params[:opponent_email]).api_token
      }

      render json: Game.create(game_attributes)
    else
      render :file => "public/401.html", :status => :unauthorized
    end
  end
end
