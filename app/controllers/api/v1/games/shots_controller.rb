class Api::V1::Games::ShotsController < ApiController
  def create
    game = Game.find(params[:game_id])

    auth_token = response.request.env["HTTP_X_API_KEY"]

    if game.validate_turn(auth_token) == true
      turn_processor = TurnProcessor.new(game, params[:shot][:target])

      turn_processor.run!
      game.change_turns
      render json: game, message: turn_processor.message
    else
      render json: game, message: game.validate_turn
    end
  end
end
