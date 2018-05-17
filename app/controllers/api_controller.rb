class ApiController < ActionController::API

  def current_player
    if request.headers['X-API-KEY'] == current_game.player_1_id.api_key
      current_game.player_1_i
    elsif request.headers['X-API-KEY'] == current_game.player_2_id.api_key
      current_game.player_2_id
    end
  end

  def current_game
    Game.find(params[:game_id])
  end

end
