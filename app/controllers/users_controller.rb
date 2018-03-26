class UsersController < ApplicationController
  def show
    @user = User.find(session[:user_id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      RegistrationMailer.activate(@user).deliver_now
      redirect_to dashboard_path
    else
      render :new
    end
  end

  private
    def user_params
      params[:user][:api_key] = SecureRandom.base64
      params.require(:user).permit(:name, :password, :email, :password_confirmation, :api_key)
    end
end
