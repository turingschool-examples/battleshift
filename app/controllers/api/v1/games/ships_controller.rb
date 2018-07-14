class Api::V1::Games::ShipsController < ApiController
  def create
    key = request.env["HTTP_X_API_KEY"]
    game_id = params[:game_id]
    ch = ControllerHelper.new(key, game_id)
    game = ch.place_ship(ship_params)
    render json: game
  end

  private

  def ship_params
    {
      ship_size: params[:ship_size].to_i,
      start_space: params[:start_space],
      end_space: params[:end_space]
    }
  end
end
