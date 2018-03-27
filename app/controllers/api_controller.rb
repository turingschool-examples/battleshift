class ApiController < ActionController::API
  def require_game
    render status: 400 if Game.where(id: params[:id]).empty?
  end
end
