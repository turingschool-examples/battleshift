module Api
  module V1
    module Games
      class ShotsController < ApiController
        def create
          key = request.env["HTTP_X_API_KEY"]
          game_id = params[:game_id]
          ch = ControllerHelper.new(key, game_id)
          game = ch.fire_shot(params[:target])

          render json: game, status: ch.status_code
        end
      end
    end
  end
end
