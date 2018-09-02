class Api::V1::Games::ShipsController < ApplicationController
  def create
    if game = Game.find(params[:game_id])
      if request.headers['X-API-Key'] == game.player_key
        ship = Ship.new(params[:ship_size])
        ShipPlacer.new(board: game.player_1_board,
                       ship: ship,
                       start_space: params[:start_space],
                       end_space: params[:end_space]).run
        game.save
        render json: game
      elsif request.headers['X-API-Key'] == game.opponent_key
        ship = Ship.new(params[:ship_size])
        ShipPlacer.new(board: game.player_2_board,
                       ship: ship,
                       start_space: params[:start_space],
                       end_space: params[:end_space]).run
        game.save
        render json: game
      else
        render :file => "public/401.html", :status => :unauthorized
      end
    end
  end
end
