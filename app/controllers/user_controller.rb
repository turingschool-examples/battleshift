class UserController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save!
      session[:user_id] = user.id
      redirect_to "/dashboard"
    else
      render :new
    end
  end

  def show
  end

  private

    def user_params
      params.permit(:name, :email, :password, :password_confirmation)
    end
end
