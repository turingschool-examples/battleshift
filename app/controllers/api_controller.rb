class ApiController < ActionController::API

  def current_user
    if request.env["HTTP_X_API_KEY"]
      @current_user ||= User.find_by(user_token: request.env["HTTP_X_API_KEY"])
    end
  end

  def current_users_turn?
    current_user == game.current_turn_user
  end
  
  private

  def game
    @game ||= Game.find(params[:game_id])
  end
end
