class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if user_params[:password] == params["user"]["password_confirmation"]
      @user = User.create(user_params)
      session[:user_id] = @user.id
      redirect_to confirmation_path
    else
      flash[:notice] = 'Password and Password Confirmation do not match'
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end
