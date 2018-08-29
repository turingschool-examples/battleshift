class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserConfirmationMailer.confirmation(@user).deliver_now
      flash[:success] = "Please confirm your email address"
      session[:user_id] = @user.id
      redirect_to dashboard_path
    else
      flash[:error] = "Something went wrong"
      render :new
    end
  end

  def confirm_email
    user = User.find_by_email_token(params[:id])
    if user
      user.email_activate
      flash[:success] = "Welcome to Battleshift"
      redirect_to dashboard_path
    else
      flash[:error] = "You have to set up your account prior to play"
      redirect_to '/register'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
