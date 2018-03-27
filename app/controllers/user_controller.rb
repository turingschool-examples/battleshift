class UserController < ApplicationController

  def new
  end

  def create
    user = User.new(user_params)
    if user.save!
      ActivationMailer.activation_email(user).deliver_now
      session[:user_id] = user.id
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def show
    @user = current_user
  end

  private

    def user_params
      params.permit(:name, :email, :password, :password_confirmation)
    end
end
