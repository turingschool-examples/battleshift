class Api::V1::Games::ShotsController < ApiController
  def create
    if game = Game.find(params[:game_id])
      if game.opponent_key != 'computer'
        turn_processor = TurnProcessor.new(game, params[:shot][:target], request.headers['X-API-Key'])

        turn_processor.two_player_run!
        render json: game, status: turn_processor.status, message: turn_processor.message
      else
        turn_processor = TurnProcessor.new(game, params[:shot][:target])

        turn_processor.run!
        render json: game, status: turn_processor.status, message: turn_processor.message
      end
    end
  end
end
