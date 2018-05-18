class ApiController < ActionController::API
  before_action :require_api_key

  def current_player
    if request.headers['X-API-KEY'] == current_game.player_1.api_key
      current_game.player_1
    elsif request.headers['X-API-KEY'] == current_game.player_2.api_key
      current_game.player_2
    end
  end

  def current_board
    if current_player == current_game.player_1
      current_game.player_1_board
    elsif current_player == current_game.player_2
      current_game.player_2_board
    end
  end

  def opponent_board
    if current_player == current_game.player_1
      current_game.player_2_board
    elsif current_player == current_game.player_2
      current_game.player_1_board
    end
  end

  def current_game
    @game ||= Game.find(params[:game_id])
  end

  private

  def require_api_key
    user = User.find_by_api_key(request.headers['X-API-Key'])

    render json: {message: 'Unauthorized'}.to_json, status: 401 and return false if user.nil?
  end

end
