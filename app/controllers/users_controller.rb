class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    AccountActivationMailer.activation_token(user).deliver_now
    session[:user_id] = user.id
    redirect_to dashboard_path
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
