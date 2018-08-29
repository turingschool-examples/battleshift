module Api
  module V1
    module Games
      class ShipsController < ApiController

      # TODO create authentication method for create function

        def create
          @game = Game.find(params[:game_id])

          ship = Ship.new(params[:ship_size])

          board = authenticate_board(request.headers["auth_token"])

          ShipPlacer.new(
                           board: board,
                           ship: ship,
                           start_space: params[:start_space],
                           end_space: params[:end_space]
                        ).run
          @game.save

          render(json: { message: "Successfully placed ship with a size of 3. You have 1 ship(s) to place with a size of 2."}, status: 200)
        end

        private

        def authenticate_board(auth_token)
          if auth_token == @game.player_1_auth_token
            @game.player_1_board
          elsif auth_token == @game.player_2_auth_token
            @game.player_2_board
          end
        end
      end
    end
  end
end
