class ApiController < ActionController::API
  def current_game
    @current_game ||= Game.find(params[:game_id])
  end
end
