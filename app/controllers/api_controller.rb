class ApiController < ActionController::API
  protected

  def find_game
    game = Game.find_by_id(params[:id])
  end

  def render_400(message)
    render json: message, status: 400
  end
end
