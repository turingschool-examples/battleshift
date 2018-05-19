class ApiController < ActionController::API
  protected

  def api_key
    request.headers['X-API-key']
  end

  def find_game
    @game = if params[:id]
             Game.find_by_id(params[:id])
           else
             Game.find_by_id(params[:game_id])
           end
  end

  def render_400(message)
    render json: message, status: 400
  end
end
