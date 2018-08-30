module Api
  module V1pa
    class GamesController < ActionController::API
      def show
        game = Game.find_by_id(params[:id])
        if game
          render json: game
        else
          render status: 400
        end
      end

      def create
        #if curent_user.active && params[api_key] == current_user.api_key
        #need email to create player_2 i.e. params[:oppnent_email]
        binding.pry
        game = Game.new
      end
    end
  end
end
