class GamesController < ApplicationController

  def show
    @game = Game.find(params[:id])
  end

  def new
  end

  def create
    new_game = current_user.games.new(player_1_board: Board.new(params[:difficulty].to_i), player_2_board: Board.new(params[:difficulty].to_i))
    if new_game.save
      UserMailer.game_invite(params[:email])
      redirect_to game_path(new_game)
    else
      render :new
    end
  end

end
