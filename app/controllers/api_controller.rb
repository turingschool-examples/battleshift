class ApiController < ActionController::API

  def current_user
    if request.env["HTTP_X_API_KEY"]
      @current_user ||= User.find_by(user_token: request.env["HTTP_X_API_KEY"])
    end
  end

  def current_users_turn?
    current_user == game.current_turn_user
  end

  def authorized?
    if request.env["HTTP_X_API_KEY"] != game.player_1.user_token && request.env["HTTP_X_API_KEY"] != game.player_2.user_token
      render json: game, message: "Unauthorized", status: 401
    end
  end

  def game_over?
    if game.winner
      render json: game, message: "Invalid move. Game over.", status: 400
    end
  end

  private

  def game
    @game ||= Game.find(params[:game_id])
  end
end
