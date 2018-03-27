class Api::V1::Games::ShipsController < ApiController
  def create
    game = Game.find(params[:game_id])
    ship = Ship.new(params[:ship_size].to_i)
    ship_placer = ShipPlacer.new(game.player_1_board, ship, params[:start_space], params[:end_space])
    ship_placer.run
    game.save
    render json: game, message: ship_placer.message
  end
end
