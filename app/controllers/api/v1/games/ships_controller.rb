class Api::V1::Games::ShipsController < ApplicationController
  def create
    if game = Game.find(params[:game_id])
      if request.headers['X-API-Key'] == game.player_key
        ship = Ship.new(params[:ship_size])
        a = ShipPlacer.new(game.player_1_board, ship, params[:start_space], params[:end_space]).run
        binding.pry
      end
    end
  end
end
