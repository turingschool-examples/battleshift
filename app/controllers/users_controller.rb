class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      UserMailer.activation_request(@user).deliver_now
      redirect_to '/dashboard'
    else
      render :new
    end
  end

  def update
    @user = User.find(params[:id])
    @user.status = 'active'
    if @user.save
      flash[:success] = 'Thank you! Your account is now activated.'
    else
      flash[:error] = 'Sorry, your account was not activated.'
    end
    redirect_to dashboard_path
  end
  
  private

  def user_params
    params.require(:user).permit(:name,
                                 :email,
                                 :password,
                                 :password_confirmation)
  end
end
