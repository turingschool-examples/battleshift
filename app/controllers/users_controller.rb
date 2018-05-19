require 'sendgrid-ruby'

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.with(user: @user).activation_email.deliver_now
      session[:user_id] = @user.id

      redirect_to '/dashboard'
    else
      # TODO: Make this error more descriptive
      flash[:error] = 'There was a problem creating your user.'
      render :new
    end
  end

  def show
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
