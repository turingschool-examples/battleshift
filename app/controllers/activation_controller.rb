class ActivationController < ApplicationController

  def new
    if activation_params
      key = ActivationKey.find_by(activation_params)
      user = User.find(key.user_id)
      user.update_attribute(:status, "active")
      session[:user_id] = user.id
      user.assign_api_key(user)
      UserMailer.welcome_email(user).deliver_now
      redirect_to activate_success_path
    else
      render :show
    end
  end

  def show
  end

  private

  def activation_params
    params.permit(:activation_key)
  end
end
