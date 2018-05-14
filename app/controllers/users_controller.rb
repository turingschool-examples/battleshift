class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Created a new account"
      redirect_to dashboard_path
    else
      flash.now[:error] = "Unable to create account"
      render :new
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation, :email)
    end
end
