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
    #if curent_user.active && params[api_key] == current_user.api_key
    #need email to create player_2 i.e. params[:oppnent_email]
    api_key = request.headers['X-API-Key']

    game_attributes = {
      player_1_board: Board.new(4),
      player_2_board: Board.new(4),
      player_1_turns: 0,
      player_2_turns: 0,
      current_turn: 0,
      player_id: User.find_by(api_token: api_key).id,
      opponent_id: User.find_by(email: ENV['BATTLESHIFT_OPPONENT_EMAIL']).id
    }

    render json: Game.create(game_attributes)
  end
end
