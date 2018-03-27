class UserController < ApplicationController

  def new
  end

  def create
    user = User.new(user_params)
    if user.save!
      session[:user_id] = user.id
      ActivationKey.create(user_id: user.id, activation_key: create_activation_key(user)[:activation_key])
      ActivationMailer.activation_email(user).deliver_now
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

    def create_activation_key(user)
      {activation_key: (rand(10 ** 20).to_s + (user.id).to_s)}
    end
end
