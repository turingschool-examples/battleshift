class UsersController < ApplicationController

  def new
    @user = User.new
  end 

  def create
    user = User.new(user_params)
    user.save
    flash[:notice] = "Logged in as #{user.name}"
    session[:user_id] = user.id
    redirect_to "/dashboard"
  end 

  def show
    if current_user.is_activated?
      @message = "is activated"
    else 
      @message = "This account has not been activated. Please check your email."
    end 
  end
  
  private

  def user_params
    params.require(:user).permit(:email, :name, :password, :confirm_password)
  end
end 