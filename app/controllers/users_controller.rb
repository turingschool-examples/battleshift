class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.registration_email(@user).deliver_now
      login(@user)
    else
      flash[:notice] = "Please try again!"
      render :new
    end
  end

  def show
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
