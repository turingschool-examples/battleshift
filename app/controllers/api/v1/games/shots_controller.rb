class Api::V1::Games::ShotsController < ApiController
  # before_action :your_turn?

  def create
    game = Game.find(params[:game_id])
    require 'pry'; binding.pry
    turn_processor = TurnProcessor.new(game, params[:shot][:target])

    turn_processor.run!
    game.turn_switcher(current_user)
    game.save!
    targeted_space = game.player_2_board.locate_space(params[:shot][:target])
    render json: game, message: turn_processor.message
  end
end
