class Api::V1::GamesController < ActionController::API
  def show
    game = Game.find(params[:id])
    render json: game
  end

  def create
    challenger = User.find_by(user_token: request.env["HTTP_X_API_KEY"])
    opponent = User.find_by(email: params[:opponent_email])
    require 'pry'; binding.pry
    game = Game.create(challenger_token: challenger.user_token, opponent_token: opponent.user_token)
  end
end

