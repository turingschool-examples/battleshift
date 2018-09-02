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
        render json: game, message: message
      elsif request.headers['X-API-Key'] == game.opponent_key
        ship = Ship.new(params[:ship_size])
        ShipPlacer.new(board: game.player_2_board,
                       ship: ship,
                       start_space: params[:start_space],
                       end_space: params[:end_space]).run
        game.save
        render json: game, message: message
      else
        render :file => "public/401.html", :status => :unauthorized
      end
    end
  end

  def message
    if params[:ship_size] == 3
      "Successfully placed ship with a size of 3. You have 1 ship(s) to place with a size of 2."
    elsif params[:ship_size] == 2
      "Successfully placed ship with a size of 2. You have 0 ship(s) to place."
    end
  end
end
