class Api::V1::Games::ShotsController < ApiController
  before_action :require_game, :require_current_turn

  def create
    opponent_board = case request.headers['X-API-KEY']
                     when current_game.player_1.api_key then current_game.player_2.board
                     when current_game.player_2.api_key then current_game.player_1.board
                     end

    turn_processor = TurnProcessor.new(current_game, params[:shot][:target], opponent_board)
    turn_processor.run!
    # put below in Turn Processor
    current_game.current_turn = current_game.player_1.turns - current_game.player_2.turns
    current_game.save
    #

    render json: current_game, message: turn_processor.message
  end

  private
    def require_current_turn
      render json: current_game, message: "Invalid move. It's your opponent's turn." unless correct_player?
    end

    def correct_player?
      players[request.headers["X-API-KEY"]] == current_game.current_turn
    end

    def players
      {current_game.player_1.api_key => "player_1", current_game.player_2.api_key => "player_2"}
    end

end
