class Api::V1::GamesController < ActionController::API
  before_action :authenticate_token, :authenticate_email

  def create

    # TODO: validate_game_response(game_data: response.body, board_size: board_size)

    game = Game.new({
      player_1_board: Board.new(4),
      player_2_board: Board.new(4),
      player_1_turns: 0,
      player_2_turns: 0,
      player_1_auth_token: User.find_by(auth_token: request.headers["X-API-KEY"]).auth_token,
      player_2_auth_token: User.find_by(email: params[:opponent_email]).auth_token,
      current_turn: "player_1"
    })

    if game.save!
      render json: game
    else
      render json: "the game could not be made"
    end
  end


  def show
    # TODO: params[:auth_token] instead?
    if game = Game.find_by_id(params[:id])
      render json: game
    else
      head :bad_request
    end
  end

  private

  def authenticate_token
    api_key = request.headers['X-API-KEY']
    user = User.where(auth_token: api_key).first if api_key
    unless user
      head(:bad_request)
      return false
    end
  end

  def authenticate_email
    email = params[:opponent_email]
    user = User.where(email: email).first if email
    unless user
      head(:bad_request)
      return false
    end
  end
end
