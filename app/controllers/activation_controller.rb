class ActivationController < ApplicationController

  def new
    if activation_params
      user = User.find_by(activation_params)
      user.update_attribute(:status, "active")
      session[:user_id] = user.id
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
