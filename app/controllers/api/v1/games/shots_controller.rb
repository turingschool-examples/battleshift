class Api::V1::Games::ShotsController < ApiController
  before_action :game_over?, :authorized?

  def create
    game = Game.find(params[:game_id])

    if current_users_turn?
      turn_processor = TurnProcessor.new(game, params[:shot][:target])
      turn_processor.run!
      if turn_processor.message == "Invalid coordinates."
        render json: game, message: turn_processor.message, status: 400
        game.save!
      else
        render json: game, message: turn_processor.message
        game.turn_switcher(current_user)
        game.save!
      end
    else
     render json: game, message: "Invalid move. It's your opponent's turn", status: 400
    end
  end
end
