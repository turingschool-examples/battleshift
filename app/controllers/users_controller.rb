class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      flash[:success] = "Logged in as #{user.name}"

      redirect_to '/dashboard'
      UserActivatorMailer.welcome_email(user).deliver_now
    else
      redirect_to new_user_path
    end
  end

  def show
  end

  def update
    user = User.find(params[:id])
    user.status = 'active'
    if user.save
      flash[:active] = "Thank you! Your account is now activated."
    else
      flash[:error] = "Oops, something went wrong"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
