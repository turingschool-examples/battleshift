class Api::V1::Games::ShotsController < ApiController
 

  def create
    # require 'pry'; binding.pry
    game = Game.find(params[:game_id])
    if current_users_turn?
      turn_processor = TurnProcessor.new(game, params[:shot][:target])
      turn_processor.run!

      game.turn_switcher(current_user)

      game.save!
      render json: game, message: turn_processor.message
    else
     render json: game, message: "Invalid move. It's your opponent's turn" , status: 400
    end
  end
end
