require 'securerandom'

class UsersController < ApplicationController

  def show
    @user_facade = UserFacade.new(params[:id])
  end

  def index
    @users_facade = UsersFacade.new
  end

  def edit
    @user_id = params[:id]
  end

  def update
    service = UserService.new(params[:id])
    user = JSON.parse(service.user_patch(params[:email]).body)
    flash[:notice] = "Successfully updated #{user["name"]}."
    redirect_to "/users"
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      @user.api_key = SecureRandom.urlsafe_base64
      UserMailer.activation(@user)
      flash[:notice] = "This account has not yet been activated. Please check your email."
      redirect_to dashboard_path
    else
      render :new
    end
  end

  private

    def user_params
      params.require(:user).permit(:id, :name, :email, :password, :password_confirmation)
    end

end
