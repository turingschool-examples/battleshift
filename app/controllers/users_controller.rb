class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:id] = @user.id
      UserMailer.registration_email(@user).deliver_now
      flash[:notice] = "Logged in as #{@user.name}"
        redirect_to '/dashboard'
    else
      flash[:notice] = "Please try again!"
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
