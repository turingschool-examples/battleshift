class Api::V1::Games::ShipPlacementController < ApiController
  def create
    game = Game.find(params[:game_id])
    user = User.find_by(user_token: request.env["HTTP_X_API_KEY"])
    if user.user_token == game.player_1_token
      board = game.player_1_board
    else
      board = game.player_2_board
    end

    require 'pry'; binding.pry
  end
end