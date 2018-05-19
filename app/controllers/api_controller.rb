class ApiController < ActionController::API
  def current_game
    current_game_id = params[:game_id] || params[:id]
    @current_game ||= Game.find(current_game_id)
    @current_game
  end

  def current_player
    @current_player ||= case request.headers['X-API-KEY']
                        when current_game.player_1.api_key then current_game.player_1
                        when current_game.player_2.api_key then current_game.player_2
                        end
  end

  # @current_game.player_2.board.board.flatten.flatten[0].values[0].contents.damage
  # @current_game.player_2.board.board.flatten.map(&:values).flatten.map(&:contents).compact.size

  def current_player?
    current_game.current_turn == 'player_1' && request.headers['X-API-KEY'] == current_game.player_1.api_key || current_game.current_turn == 'player_2' && request.headers['X-API-KEY'] == current_game.player_2.api_key
  end
end
