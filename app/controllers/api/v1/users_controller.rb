module Api
  module V1
    class UsersController < ApiController
      def index
        render json: User.all
      end

      def show
        render json: User.find(params[:id])
      end

      def update
        user = User.find(params[:id])
        if user.update(user_params)
          render json: user
        end
      end

      private
        def user_params
          params.permit(:email)
        end
    end
  end
end
