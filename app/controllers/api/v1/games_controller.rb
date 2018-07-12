module Api
  module V1
    class GamesController < ApiController
      def show
        game = Game.find(params[:id])
        render json: game
      end

      def create
        p1 = User.find_by(api_key: game_params[:api_key])
        player_not_activated(p1) if !p1.activated
        p2 = User.find_by(username: game_params[:player_2_username])
        player_2_not_registered(game_params[:player_2_username]) if p2.nil?
        player_not_activated(p2) if !p2.activated
        game = Game.create(player_1_id: p1.id, player_2_id: p2.id, player_1_api_key: p1.api_key, player_2_api_key: p2.api_key)
        invite_player_2(p2, game)
      end

      private

      def game_params
        params.require(:game).permit(:api_key, :player_2_username)
      end
      
      def player_not_activated(player)
        BattleshipNotifierMailer.welcome(player, request.base_url).deliver_now
        if player == p1
          render json: { message: "You must activate your account before you can play a game. Check your email for another activation email."}, status: 400
        else
          render json: { message: "You're opponent must activate their account before you can play a game. They have been sent an activation email."}, status: 400
        end
      end
      
      def player_2_not_registered(p2_email)
        BattleshipNotifierMailer.register(p2_email).deliver_now
        render json: { message: "Your oponent must create an account before you can play a game. They can check their email for a registration link."}, status: 400
      end

      def invite_player_2(p2, game)
        BattleshipNotifierMailer.invitation(p2, request.base_url).deliver_now
        render json: { message: "#{p2.first_name} has been invited to play a game of Battleship with you.", id: "#{game.id}" }
      end
    end
  end
end
