class ControllerHelper
  attr_reader :valid

  def initialize(key, game_id)
    @user = User.find_by(api_key: key)
    @game = Game.find(game_id)
    if @user != @game.player_1 && @user != @game.player_2
      @valid = false
    else
      @valid = true
    end
  end
end

    # user = User.find_by(api_key: key)
    # game = Game.find(params[:game_id])
    # if game.player_1 == user
    #   board = game.player_1_board
    # elsif game.player_2 == user
    #   board = game.player_2_board
    # else
    #   render json: {"message" => "Bad request"}, status: 400
    # end
