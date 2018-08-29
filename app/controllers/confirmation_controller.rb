class ConfirmationController < ApplicationController

  def show
    @user = User.find_by_email_token(params[:id])
    if @user
      @user.email_activate
      flash[:success] = "Welcome to Battleshift"
    else
      flash[:error] = "You have to set up your account prior to play"
      redirect_to '/register'
    end
  end
end
