module Api
  module V1
    module Games
      class ShipsController < ApiController 
        before_action :find_game, only: [:index]
        before_action :set_board, only: [:index]

        def index
          length = params[:ship_size]
          start_space = params[:start_space]
          end_space = params[:end_space]
          ship = Ship.new(length)
          ship.place(start_space, end_space)
  
          ship_placer = ShipPlacer.new(board: @board, ship: ship, start_space: params['start_space'], end_space: params['end_space'])
          ship_placer.run
          message = ship_placer.message #call the message from the ShipPlacer
          @game.save!
          render json: @game, message: message
        end


        private

        def set_board
          if api_key == @game.p1.api_key
            @board = @game.p1_board
          else
            @board = @game.p2_board
          end
        end
      end
    end
  end
end
