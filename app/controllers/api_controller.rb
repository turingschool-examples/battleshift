class ApiController < ActionController::API
  helper_method :current_player

  def current_player
    api_key = request.headers['X-API-KEY']
    if api_key = current_game.player_1.api_key
      player_1
    elsif api_key = current_game.player_2.api_key
      player_2
    end
  end

  def current_game
    @game ||= Game.find(params[:id])
  end
end
