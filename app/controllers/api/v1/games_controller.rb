class Api::V1::GamesController < ActionController::API

  def show
    game = Game.find(params[:id])
    render json: game
  end
end
