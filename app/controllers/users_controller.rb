class UsersController < ApplicationController
  def show
    @user = User.find_by_user_token(session[:user_token])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "User successfully created"
      session[:user_token] = @user.user_token
      redirect_to dashboard_path
      UserActivationMailer.user_activation(@user).deliver_now
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def update
    # change status to active after clicking email link
    # user = User.find_by(user_token: params[:user_token])
    # user.update!(status: 1)
    # session[:user_token] = user.user_token
    # redirect_to dashboard_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end
end
